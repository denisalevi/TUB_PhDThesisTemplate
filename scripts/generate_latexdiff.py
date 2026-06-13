#!/usr/bin/env python3
r"""Generate a compileable latexdiff against a Git merge base.

The thesis uses the chapterfolder package's \cfchapter macro, which common
LaTeX flatteners do not understand. This script snapshots two revisions,
rewrites \cfchapter calls to ordinary \chapter + \input calls, recursively
flattens \input/\include files, and runs latexdiff on the flattened sources.
"""

from __future__ import annotations

import argparse
import os
import re
import shutil
import subprocess
import sys
import tarfile
import tempfile
from pathlib import Path


ROOT_INPUT = "thesis.tex"
DEFAULT_OUTPUT = "thesis-latexdiff.tex"
LATEXDIFF_MOVING_ARG_PATCH = r"""
% Make latexdiff markup safe in moving arguments such as section titles,
% captions, the table of contents, and hyperref PDF bookmarks.
\pdfstringdefDisableCommands{%
  \def\DIFadd#1{#1}%
  \def\DIFdel#1{}%
  \def\DIFaddbegin{}%
  \def\DIFaddend{}%
  \def\DIFdelbegin{}%
  \def\DIFdelend{}%
  \def\DIFaddFL#1{#1}%
  \def\DIFdelFL#1{}%
  \def\DIFaddbeginFL{}%
  \def\DIFaddendFL{}%
  \def\DIFdelbeginFL{}%
  \def\DIFdelendFL{}%
  \def\uwave#1{#1}%
  \def\sout#1{}%
}
"""
IGNORE_DIRS = {
    ".git",
    ".github",
    ".claude",
    ".codex",
    ".vscode",
    "output",
    "ci_artifacts",
    "__pycache__",
}


def run(args: list[str], cwd: Path, stdout=None) -> subprocess.CompletedProcess:
    return subprocess.run(args, cwd=cwd, check=True, text=False, stdout=stdout)


def git_archive(ref: str, destination: Path, repo: Path) -> None:
    archive = subprocess.Popen(
        ["git", "archive", "--format=tar", ref],
        cwd=repo,
        stdout=subprocess.PIPE,
    )
    try:
        with tarfile.open(fileobj=archive.stdout, mode="r|") as tar:
            tar.extractall(destination)
    finally:
        if archive.stdout:
            archive.stdout.close()
    ret = archive.wait()
    if ret != 0:
        raise subprocess.CalledProcessError(ret, ["git", "archive", ref])


def copy_working_tree(source: Path, destination: Path) -> None:
    def ignore(_: str, names: list[str]) -> set[str]:
        ignored = set()
        for name in names:
            if name in IGNORE_DIRS:
                ignored.add(name)
        return ignored

    shutil.copytree(source, destination, ignore=ignore, dirs_exist_ok=True)


def is_commented(text: str, pos: int) -> bool:
    line_start = text.rfind("\n", 0, pos) + 1
    return text[line_start:pos].lstrip().startswith("%")


def find_matching_brace(text: str, start: int) -> int:
    if start >= len(text) or text[start] != "{":
        raise ValueError("expected opening brace")
    depth = 0
    escaped = False
    for i in range(start, len(text)):
        ch = text[i]
        if escaped:
            escaped = False
            continue
        if ch == "\\":
            escaped = True
            continue
        if ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
            if depth == 0:
                return i
    raise ValueError("unmatched brace")


def skip_space_and_optional_arg(text: str, pos: int) -> int:
    while pos < len(text) and text[pos].isspace():
        pos += 1
    if pos < len(text) and text[pos] == "[":
        depth = 0
        for i in range(pos, len(text)):
            if text[i] == "[":
                depth += 1
            elif text[i] == "]":
                depth -= 1
                if depth == 0:
                    return skip_space_and_optional_arg(text, i + 1)
        raise ValueError("unmatched optional argument")
    return pos


def parse_braced_arg(text: str, pos: int) -> tuple[str, int]:
    pos = skip_space_and_optional_arg(text, pos)
    if pos >= len(text) or text[pos] != "{":
        raise ValueError("expected braced argument")
    end = find_matching_brace(text, pos)
    return text[pos + 1 : end], end + 1


def rewrite_cfchapter(text: str) -> str:
    out: list[str] = []
    pos = 0
    token = r"\cfchapter"
    while True:
        idx = text.find(token, pos)
        if idx == -1:
            out.append(text[pos:])
            break
        if is_commented(text, idx):
            out.append(text[pos : idx + len(token)])
            pos = idx + len(token)
            continue
        out.append(text[pos:idx])
        try:
            after = idx + len(token)
            after = skip_space_and_optional_arg(text, after)
            title, after = parse_braced_arg(text, after)
            folder, after = parse_braced_arg(text, after)
            file_name, after = parse_braced_arg(text, after)
        except ValueError:
            out.append(text[idx : idx + len(token)])
            pos = idx + len(token)
            continue
        input_path = f"{folder.strip()}/{file_name.strip()}"
        out.append(f"\\chapter{{{title}}}\n\\input{{{input_path}}}")
        pos = after
    return "".join(out)


INCLUDE_RE = re.compile(r"\\(input|include)\s*\{([^}]+)\}")


def resolve_tex_path(root: Path, including_file: Path, raw_path: str) -> Path | None:
    cleaned = raw_path.strip()
    if not cleaned:
        return None
    candidates = []
    base = Path(cleaned)
    if base.suffix:
        candidates.append(base)
    else:
        candidates.extend([base.with_suffix(".tex"), base])

    # Most thesis paths are root-relative. Try that first, then file-relative.
    for candidate in candidates:
        for prefix in (root, including_file.parent):
            resolved = (prefix / candidate).resolve()
            try:
                resolved.relative_to(root.resolve())
            except ValueError:
                continue
            if resolved.exists():
                return resolved
    return None


def flatten_file(path: Path, root: Path, stack: tuple[Path, ...] = ()) -> str:
    if path in stack:
        return f"\n% Skipped recursive input: {path.relative_to(root)}\n"
    text = path.read_text(encoding="utf-8")
    text = rewrite_cfchapter(text)

    pieces: list[str] = []
    pos = 0
    for match in INCLUDE_RE.finditer(text):
        if is_commented(text, match.start()):
            continue
        pieces.append(text[pos : match.start()])
        raw_include = match.group(2)
        include_path = resolve_tex_path(root, path, raw_include)
        if include_path is None:
            pieces.append(f"\n% Missing input omitted while generating latexdiff: {raw_include}\n")
        else:
            rel = include_path.relative_to(root)
            pieces.append(f"\n% BEGIN flattened input: {rel}\n")
            pieces.append(flatten_file(include_path, root, stack + (path,)))
            pieces.append(f"\n% END flattened input: {rel}\n")
        pos = match.end()
    pieces.append(text[pos:])
    return "".join(pieces)


def write_flattened(snapshot: Path, output: Path) -> None:
    root_file = snapshot / ROOT_INPUT
    flattened = flatten_file(root_file, snapshot)
    output.write_text(flattened, encoding="utf-8")


def patch_latexdiff_output(path: Path) -> None:
    text = path.read_text(encoding="utf-8")
    replacements = {
        r"\providecommand{\DIFadd}[1]{{\protect\color{blue}\uwave{#1}}} %DIF PREAMBLE": (
            r"\DeclareRobustCommand{\DIFadd}[1]{{\protect\color{blue}\uwave{#1}}} %DIF PREAMBLE"
        ),
        r"\providecommand{\DIFdel}[1]{{\protect\color{red}\sout{#1}}} %DIF PREAMBLE": (
            r"\DeclareRobustCommand{\DIFdel}[1]{{\protect\color{red}\sout{#1}}} %DIF PREAMBLE"
        ),
    }
    for old, new in replacements.items():
        text = text.replace(old, new)

    marker = r"\providecommand{\DIFdelendFL}{} %DIF PREAMBLE"
    if marker in text and LATEXDIFF_MOVING_ARG_PATCH not in text:
        text = text.replace(marker, marker + LATEXDIFF_MOVING_ARG_PATCH, 1)
    path.write_text(text, encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base-ref", required=True, help="Git ref for the base tree")
    parser.add_argument("--head-ref", help="Git ref for the head tree")
    parser.add_argument(
        "--head-working-tree",
        action="store_true",
        help="Use the current working tree as head instead of --head-ref",
    )
    parser.add_argument("--output", default=DEFAULT_OUTPUT, help="Output diff .tex path")
    parser.add_argument("--work-dir", default="ci_artifacts/latexdiff-work")
    args = parser.parse_args()

    if bool(args.head_ref) == bool(args.head_working_tree):
        parser.error("Specify exactly one of --head-ref or --head-working-tree")

    repo = Path.cwd().resolve()
    work_dir = (repo / args.work_dir).resolve()
    if work_dir.exists():
        shutil.rmtree(work_dir)
    work_dir.mkdir(parents=True)

    base_snapshot = work_dir / "base"
    head_snapshot = work_dir / "head"
    base_snapshot.mkdir()
    head_snapshot.mkdir()

    print(f"Creating base snapshot from {args.base_ref}", file=sys.stderr)
    git_archive(args.base_ref, base_snapshot, repo)
    if args.head_working_tree:
        print("Creating head snapshot from working tree", file=sys.stderr)
        copy_working_tree(repo, head_snapshot)
    else:
        print(f"Creating head snapshot from {args.head_ref}", file=sys.stderr)
        git_archive(args.head_ref, head_snapshot, repo)

    base_flat = work_dir / "base-flat.tex"
    head_flat = work_dir / "head-flat.tex"
    write_flattened(base_snapshot, base_flat)
    write_flattened(head_snapshot, head_flat)

    output = (repo / args.output).resolve()
    print(f"Writing latexdiff to {output.relative_to(repo)}", file=sys.stderr)
    with output.open("wb") as diff_tex:
        subprocess.run(
            [
                "latexdiff",
                "--type=UNDERLINE",
                "--subtype=SAFE",
                "--floattype=FLOATSAFE",
                "--math-markup=coarse",
                "--graphics-markup=none",
                "--disable-citation-markup",
                str(base_flat),
                str(head_flat),
            ],
            cwd=repo,
            check=True,
            stdout=diff_tex,
        )
    patch_latexdiff_output(output)
    print(output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
