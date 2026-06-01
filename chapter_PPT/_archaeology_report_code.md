# Code archaeology: parallel-pathway-theory / shortcut_consolidation_model

Read-only investigation, 2026-05-28. /tmp clones removed after analysis.

## 1. Local folder README (verbatim, on divergence)

`/home/denis/projects/memory-consolidation/semantization/code/parallel-pathway-theory/README.md`:

> **NOTE**: I didn't properly push everything after my thesis... Therefore there are now two diverging branches. The `master` branch seems to contain commits until December 2018. And the `diverging_commits` branch has a bunch of diverging commits from when I deleted ANATA. Not sure what the differences are...

Top-level contents of the local folder: `documents/`, `experiments/`, `README.md`, `setup.py`, `shortcut_consolidation/`, `snep/`. No `.git` directory.

## 2. The two GitHub repos are mirrors of each other

Both repos were cloned and compared. They contain **exactly the same 164 commits and an identical working tree** on each branch.

- `git@github.com:denisalevi/parallel-pathway-theory.git`
- `git@github.com:denisalevi/shortcut_consolidation_model.git`

`diff -rq` of the `scm` working tree against the `ppt` working tree (master): empty. The "deprecated, all integrated into PPT" claim is correct in the sense that PPT was created by renaming/duplicating SCM; both still exist and are byte-identical. From here on the two repos can be treated as a single repo with two branches.

### Branch table (applies to both repos)

| Branch | HEAD | Last commit | Date | One-line purpose |
|---|---|---|---|---|
| `master` | `79b7f17` | "Update README.md" | 2020-04-17 | Thesis-era code through Dec 2018 plus 2020 README touch-ups. Contains `documents/` (PDFs of thesis/talks). |
| `diverged_commits` | `9ff715d` | "Last commit before deleting ANATA (unsorted)" | 2019-12-26 | A side branch that diverged from `master` at `9a34c85` (2018-08-31); accumulates post-thesis cleanup commits up to "delete ANATA". Sparser module (no `simulator.py`, no `willshaw/`, no `palimpsest/` experiments, no `documents/`). |

Merge base of the two branches: `9a34c85` ("Return binary unit idcs optionally in dataset", 2018-08-31). `master` has many commits not on `diverged_commits` (XOR thesis runs, `simulator.py`, palimpsest support, progress bars, heatmap plots, README + documents commits). `diverged_commits` has only a handful of unique commits, the most relevant being `4635d24` "Fix typo in setup.py" (2018-08-20) — see hydra section below.

READMEs: `master` README is the verbatim text quoted above. `diverged_commits` README is **empty** (zero bytes). No other branches have a README.

## 3. Diff matrix

`diff -rq --exclude=.git --exclude=__pycache__`. Files-differ entries quote LOC delta from `diff -u | wc -l`.

### Local vs PPT `master`

Essentially identical. One single difference:
- Only in PPT-master: `experiments/episodic_to_semantic/denoising_autoencoder/palimpsest/multiple_runs/single_run.py`.

That is, the local folder is PPT-master minus one file. No other content drift.

### Local vs PPT `diverged_commits`

Substantial drift; local has much more code.

| Path | Status | Approx LOC delta |
|---|---|---|
| `documents/` (4 PDFs) | only local | n/a |
| `experiments/.../denoising_autoencoder/palimpsest/` (30 files) | only local | n/a |
| `shortcut_consolidation/cluster_utils.py` | only local | 257 |
| `shortcut_consolidation/dataset.py` | only local | 197 |
| `shortcut_consolidation/simulator.py` | only local | 1108 |
| `shortcut_consolidation/tf_utils.py` | only local | 431 |
| `shortcut_consolidation/test_dataset.py` | only local | 149 |
| `shortcut_consolidation/test_tf_utils.py` | only local | 33 |
| `shortcut_consolidation/willshaw/` | only local | n/a |
| `experiments/.../bob_and_jenny/random_context_sweep_dps/run.py` | differs | 36 |
| `shortcut_consolidation/denoising_autoencoder/consolidation.py` | differs | 149 |
| `shortcut_consolidation/plot.py` | differs | 119 |
| `README.md` | differs | 44 (local has content; diverged is empty) |
| `experiments/.../xor_context_multiple_runs_cross_entropy_shortcut/long_direct_training/` | only diverged | n/a |

### PPT-master vs SCM-master

`diff -rq` empty. Identical.

## 4. Hydra-only directories — are they anywhere else?

| Directory | Local | PPT-master | PPT-diverged | SCM (= PPT) |
|---|---|---|---|---|
| `experiments/.../multiple_runs_thesis/` | no | no | no | no |
| `experiments/.../palimpsest/thesis_sweeps/` (incl. `person32_sweep_animals`, `person24`, `person32_animal128/...`) | no | no | no | no |
| any `multiple_runs_snep*` variants beyond the base dir | no (only base `multiple_runs_snep/`) | no (only base) | no (only base) | no (only base) |
| `multiple_runs_snep/` (base) | yes | yes | yes | yes |

None of the hydra-untracked thesis directories made it into any GitHub branch or into the local folder. The base `multiple_runs_snep/` is in all of them, but the variant directories listed in the hydra investigation (`multiple_runs_snep*` variants) are not.

Hydra's HEAD commit `4635d24` "Fix typo in setup.py" (2018-08-20) is reachable on `diverged_commits` only, not on `master`. So hydra's checkout is anchored to the `diverged_commits` branch (matching the SCM remote name that hydra used).

## 5. "Closest" relationships

- **Local folder ≈ PPT `master`.** Differ by exactly one file (`palimpsest/multiple_runs/single_run.py`, present on master, missing locally). Working tree-wise the local folder is a slightly-pruned PPT-master snapshot.
- **Hydra state ≈ PPT `diverged_commits` + 14 uncommitted modifications + untracked thesis directories.** Hydra's git HEAD sits on the diverged branch, but the on-disk content has post-HEAD modifications and large untracked thesis sweep directories that exist nowhere else.

The local folder and the hydra working tree are therefore on **different branches** of the same history, and contain meaningfully different code — the local folder carries the thesis-era `master` line (with `simulator.py`, `palimpsest/`, `willshaw/`, `documents/`), while hydra carries the `diverged_commits` line with unpushed thesis sweep work on top.

## 6. Who-has-what matrix (key items)

| Item | Local | PPT-master | PPT-diverged | SCM-default | Hydra (described) |
|---|---|---|---|---|---|
| `README.md` (content) | yes | yes | empty file | yes | yes (= PPT-diverged's, presumably) |
| `documents/` (PDFs) | yes | yes | no | yes | unknown / not described |
| `setup.py` | yes | yes | yes | yes | yes (modified or not?) |
| `shortcut_consolidation/` core (`__init__`, `denoising_autoencoder/`, `mlp_classification/`, `plot.py`, `utils.py`, `test_utils.py`) | yes | yes | yes | yes | yes |
| `shortcut_consolidation/simulator.py` (1108 LOC) | yes | yes | **no** | yes | likely no |
| `shortcut_consolidation/{cluster_utils,dataset,tf_utils,test_dataset,test_tf_utils}.py` | yes | yes | **no** | yes | likely no |
| `shortcut_consolidation/willshaw/` | yes | yes | **no** | yes | likely no |
| `snep/` | yes | yes | yes | yes | yes |
| `experiments/.../palimpsest/` | yes | yes | **no** | yes | yes (and extended with `thesis_sweeps/`) |
| `experiments/.../multiple_runs_thesis/` | **no** | **no** | **no** | **no** | **yes (only here)** |
| `experiments/.../palimpsest/thesis_sweeps/...` | **no** | **no** | **no** | **no** | **yes (only here)** |
| `multiple_runs_snep*` variants | **no** | **no** | **no** | **no** | **yes (only here)** |
| `xor_context_multiple_runs_cross_entropy_shortcut/long_direct_training/` | no | no | yes | no | unknown |

## 7. Direct answer

**Did hydra's uncommitted work end up in `parallel-pathway-theory`?** **No.** None of the thesis-era directories that are untracked on hydra (`multiple_runs_thesis/`, `palimpsest/thesis_sweeps/...`, the `multiple_runs_snep*` variants) appear in either GitHub branch or in the local folder. Whatever modifications hydra has on its 14 tracked files were also never pushed: hydra's HEAD is `4635d24` (2018-08-20) on `diverged_commits`, and that branch's tip `9ff715d` (2019-12-26) does not include them either. **Hydra is the only place that work exists.**

## 8. Recommendation (no action taken)

- Canonical "thesis code as it shipped in the master thesis PDF": **PPT `master`** (≈ local folder). Use this for any rerun of the thesis figures that does not need the post-thesis sweeps.
- Canonical "what was actually run on hydra for the final thesis sweeps": **only on hydra**. To preserve it, the right move is a one-shot read-only `rsync` of `~/projects/memory_consolidation/shortcut_consolidation_model/` off hydra into a new branch (e.g. `hydra_thesis_sweeps`) of `parallel-pathway-theory`, capturing both the 14 tracked-file modifications and the untracked thesis directories as a single commit (or two: tracked-mods, then untracked-add). The SCM repo can stay deprecated; consolidate everything onto PPT.
- The `diverged_commits` branch is a sparse cul-de-sac from the 2018-08-31 split; its only unique content of value is the `xor_context_multiple_runs_cross_entropy_shortcut/long_direct_training/` directory and a handful of merge/cleanup commits. Worth keeping as-is but not the canonical line.
- The two GitHub repos are byte-identical; pick one (PPT) as canonical and archive the other.
