# AGENTS.md

This file provides guidance to any agents when working with code in this repository.

## Repository purpose

This is Denis Alevi's PhD thesis (TU Berlin), built on the `TUB_PhDThesisTemplate` LaTeX template. The primary output is `thesis.pdf`. The template has been adapted to use `latexmk` so the same tree compiles locally and on Overleaf without changes.

## Build commands

Use `compile.sh`. It is the primary (and only) build path to use unless there is a specific reason to reach for something else.

```bash
./compile.sh                    # one-shot compile of thesis.tex
./compile.sh -pvc thesis.tex    # continuous preview: rebuilds on save
```

`compile.sh` runs `latexmk` with `-jobname=output` and writes everything (PDF + aux files) into `output/`. **The primary output is `output/output.pdf`.** On success the script also copies it to `thesis.pdf` at the repo root as a convenience; treat that root copy as derived. Exit codes `0` and `12` (nothing-to-do) are treated as success. On failure `thesis.pdf` is deleted so its absence signals failure — inspect `output/output.log` for details.

On Windows, run `compile.sh` via Git Bash.

`latexmkrc` configures `pdflatex` + `biber`, shell-escape, and the glossary custom dependencies (`makeglossaries` for `.glo→.gls` and `.acn→.acr`). Do not set `$out_dir` in `latexmkrc`; Overleaf does not support it. Overleaf itself invokes `latexmk` directly against `thesis.tex` using this same `latexmkrc`.

Clean rebuild: delete `output/` (or `latexmk -C`, which respects the extra generated extensions registered in `latexmkrc` for glossaries).

Legacy build paths (`make` with `BUILD_STRATEGY`/`BIB_STRATEGY`, and the `compile-{engine}-{bib}.bat` Windows files) are present and documented in `README.md`. They are kept in case they become useful later — do not use them for routine builds.

## Overleaf compatibility — do not break

The jobname trick is load-bearing. Everything is built with `-jobname=output` so the PDF is `output.pdf`, matching Overleaf's default. The file `output.tex` in the root is a thin wrapper (`\input{thesis}`) that exists so TikZ externalization — which re-runs the document via `\input{<jobname>}` — resolves correctly. If the main document is ever renamed away from `thesis.tex`, update `output.tex` too (or disable `tikzexternalize`). Do not rename the jobname without also updating `latexmkrc`, `compile.sh`, and `output.tex` together.

## Document architecture

Entry point: `thesis.tex` (see line 16 for the `\documentclass` options — `twoside,11pt,online,a4paper,pdfa1,custommargin,numbered,biblatex`). Long option reference for the `PhDthesisTUB` class is preserved as comments in both `thesis.tex` and `README.md`.

Structure — chapters are included via the custom `\cfchapter{title}{folder}{file}` macro (from the `chapterfolder` package), which sets the working folder for a chapter so its `\input{…}` paths and `\graphicspath{{…}}` stay relative:

- `0_frontmatter/` — abstract, zusammenfassung, dedication, acknowledgement, glossary
- `1_introduction/` — introduction
- `chapter_aims_and_contributions/` — storyline / aims (Laura's-thesis style)
- `chapter_PPT/` — Ch. on parallel pathway theory; based on Remme 2021
- `chapter_change_point_detection/` — Ch. on Bayesian change-point detection
- `chapter_drosophila/` — Ch. on Drosophila MB consolidation
- `chapter_engram_dynamics/` — Ch. on distributed engram reorganization / drift (preprint Alevi 2026)
- `7/` — Discussion
- `8/` — Materials and Methods
- `Appendix1/` — appendices
- `9_backmatter/references.bib` — single master bibliography (biblatex + biber)

Each chapter folder that represents a multi-section research chapter follows the same internal pattern: a `main.tex` that sets `\graphicspath`, writes a short "Context within thesis" paragraph, then `\input`s `abstract.tex`, `introduction.tex`, `results.tex`, `discussion.tex`, `methods.tex`, and `supplementals.tex` as applicable. Figures live in `<chapter>/figures/`, TikZ sources in `<chapter>/TikzPictures/`, and (for engram dynamics) asymptote sources in `asymptote/`. Chapter-local `.tex` files start with `%!TEX root = ../thesis.tex` so editors know the true root.

Style and preamble:
- `Classes/PhDthesisTUB.cls` — the modified TUB thesis class, not vendored from CTAN; edit here for class-level changes
- `Classes/PhDbiblio-url2.bst` — legacy bibtex style (only used when the `biblatex` class option is off)
- `Preamble/preamble.tex` — package loads, margins, chapter title format, SI units, TikZ, hyperref, etc.
- `Preamble/commands.tex` — custom macros
- `thesis-info.tex` — title / author / supervisors metadata consumed by `\maketitle`

Bibliography is biblatex-driven (`\printbibliography`); the class option `biblatex` at line 16 of `thesis.tex` is what activates it. Biber is invoked by `latexmkrc` (`$bibtex_use = 2`, `$biber = 'biber %O %S'`). Chapter-local `.bib` files (e.g. `chapter_PPT/remme2020.bib`) are scratch/reference files and are not wired into the build — the single source of truth is `9_backmatter/references.bib`.

Glossaries use `makeglossaries` via a custom latexmk dependency (`latexmkrc` lines 40–56). The `.glo/.gls`, `.acn/.acr`, and `.syg/.sls` extensions are registered as generated so `-c`/`-C` cleans them.

## Untracked scratch areas

Several directories are working scratch for the author and not part of the thesis build:
- `zotero_key_restore/` — SQL + TSV for restoring Zotero citation keys after a Zotero upgrade (see commit `7f6ea6b`)
- `chapter_PPT/comparison/`, `chapter_PPT/compare_remme2021.py`, `chapter_PPT/process_latexdiff.py`, `chapter_PPT/Remme2021.md`, `chapter_PPT/remme2020.bib`, `chapter_PPT/main-PLoS.tex` — tooling for comparing the PPT chapter against the published Remme 2021 paper
- `chapter_engram_dynamics/citation_audit_report_*.md` — citation audit notes
- `.codex`, `chapter_PPT/__pycache__/` — tooling artifacts

None of these are `\input`ed by `thesis.tex`. Before editing anything in these areas, confirm whether the user wants it included in the build.

## Conventions

- PDF/A-1b output is required (online submission). The `pdfa1` class option and the bundled ICC profiles (`coated_FOGRA39L_argl.icc`, `sRGB_IEC61966-2-1_black_scaled.icc`) plus `output.xmpdata` drive this — do not remove them.
- Language is English by default; the class supports `german` via the `german` option and `\ifCLASSINFOlangDE` guards (used e.g. for glossary titles in `thesis.tex`). Preserve both branches when editing language-gated code.
- Chapter labels follow `\label{ch:<slug>}` (e.g. `ch:ppt`, `ch:engram-reorganization`). Cross-reference chapters with `\ref{ch:…}` — several chapter summaries already do this.
- `shell-escape` is on (needed by TikZ externalization and minted). Be cautious adding packages that run external commands.
