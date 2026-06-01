# Archaeology report: post-2019 versions of master-thesis PPT figures

Read-only audit, run on 2026-05-28. Master-thesis (MT) figures in
`/home/denis/writing/manuscripts/master_thesis/fig/{mlp,dae,palimpsest}/`
were last touched in 2019. The task was to locate any *newer* (>= 2020)
renditions used in posters, talks, or abstracts.

## TL;DR

There is **no post-2019 simulation rerun** of the MT denoising-autoencoder
(DAE) / MLP / palimpsest experiments anywhere on disk. The original 2019
`shortcut_consolidation` codebase exists in two mirrored checkouts
(`semantization/code/parallel-pathway-theory/` and the nextcloud backup),
but all `.py` files are mtime-2020-04-17 (i.e. the date of the git checkout,
not new edits) and no `.npz/.pkl/.h5/.npy/.csv` artefacts from a rerun are
present. The shortcut_consolidation package does contain the original
generator scripts and is the *only* candidate source.

What does exist (post-2019) are **manually composed Inkscape SVG collages**
that reuse the MT-era rendered PNG/PGF panels and add fresh annotation,
arrows, and circuit sketches. Five locations matter:

1. `~/projects/memory-consolidation/images/ppt-tweetprint/` (2020-12-07)
2. `~/projects/memory-consolidation/images/cosyne-abstract-figure/` (2020-11-11)
3. `~/projects/memory-consolidation/images/cosyne-poster/` (2021-02)
4. `~/projects/memory-consolidation/images/Bob-dogs-semantization/` (2020-10-28)
5. `~/projects/memory-consolidation/images/ppt-theory-v-W/` and `ppt-figures-only/` (2021-10-14)

The polished final outputs for the COSYNE 2021 abstract & poster live in
`~/documents/conference-posters/COSYNE-2021-online/{abstract.pdf,poster.pdf}`.

## Candidate roots inspected

Discovery query:
`find /home/denis -maxdepth 4 -type d -iname "*poster*|*talk*|*slide*|*abstract*|*conference*"`,
filtered to remove caches/snap/git. Plausible roots actually examined:

- `/home/denis/documents/conference-posters/{CNS-2020-Boston-Virtual,COSYNE-2021-online}`
- `/home/denis/documents/talks/{2020-04-21-...,2020-05-02-CNS-virtual-poster-...,2020-10-28-Neuromatch,2021-02-Cosyne}`
- `/home/denis/projects/memory-consolidation/images/` (entire tree)
- `/home/denis/projects/memory-consolidation/semantization/{talks,posters,images,code}`
- `/home/denis/projects/memory-consolidation/dynamic-environments/talks`
- `/home/denis/projects/memory-consolidation/parallel-pathway-theory/`
- `/home/denis/projects/memory-consolidation/drosophila/`
- `/home/denis/projects/bak-nextcloud-mess/{memory_semantization,drosophila_consolidation,human-consolidation}/`
- `/home/denis/writing/manuscripts/drift-as-consolidation/{talks,abstracts,overleaf,resources}`

Out-of-scope roots (already-2025 drift work, unrelated topics, no MT fig
re-renders): `drift-as-consolidation`, `drosophila`, `dynamic-environments`,
`bak-nextcloud-mess/human-consolidation`, `documents/sprekelerlab/conferences`.

## Post-2019 figure files that are recognisable newer versions of MT fig/

Keyword filter applied to file path and (for SVG) embedded text: any of
`palimpsest, consolidation, semantization, semantic, episodic, shortcut,
parallel-pathway, PPT, replay, dae, denoising, autoencoder, forgetting,
day, night, Bob, Jenny, MTL, hippocampus, dps, xor, random`.

| Path | Size | mtime | Likely topic / what it replaces | Generating source | Referenced by |
|---|---:|---|---|---|---|
| `~/projects/memory-consolidation/images/ppt-tweetprint/Fig1-A-B-C.svg` | 70 KB | 2020-12-07 | Circuit + behavioural setup (PPT Fig 1A–C) – successor to MT Fig 1 schematic | Inkscape collage, panel C reuses raster from `shortcut_consolidation/denoising_autoencoder/consolidation.py` outputs | "tweetprint" Twitter announcement of Remme/Bergmann/Alevi/Sprekeler 2021 |
| `~/projects/memory-consolidation/images/ppt-tweetprint/Fig1-D-E.svg` | 1.7 MB | 2020-12-07 | DAE consolidation cartoon (MT `dae/` group) | Inkscape collage over rendered MT panels | tweetprint |
| `~/projects/memory-consolidation/images/ppt-tweetprint/Fig2-A-B-G.svg` | 2.8 MB | 2020-12-07 | Replay + palimpsest sweep panels — newer version of `palimpsest/consolidation.pgf` family | Inkscape collage; underlying curves from `experiments/episodic_to_semantic/denoising_autoencoder/palimpsest/...` | tweetprint |
| `~/projects/memory-consolidation/images/ppt-tweetprint/Fig3-A-C.svg` | 97 KB | 2020-12-07 | Day/night consolidation cycle illustration | Inkscape, panels mix MT raster + new arrows | tweetprint |
| `~/projects/memory-consolidation/images/ppt-tweetprint/Fig4.svg` | 169 KB | 2020-12-07 | Day-cycle summary (likely from MT `dae/palimpsest_easy_rule/consolidation.pgf`) | Inkscape | tweetprint |
| `~/projects/memory-consolidation/images/ppt-tweetprint/tweetprint-pics{,-no-wite}/[1,4,5,6,7,8].png` | <165 KB | 2020-12-03 → 2020-12-07 | PNG exports of the same Fig panels above | Inkscape export of the SVGs in same dir | tweetprint thread |
| `~/projects/memory-consolidation/images/cosyne-abstract-figure/cosyne-abstract-2021-figure.svg` | 566 KB | 2020-11-11 | One-figure abstract summary: contains Bob, MTL, cortex, dps, PPT, xor keywords | Inkscape collage (precursor of `ppt-tweetprint`) | COSYNE 2021 abstract (final at `documents/conference-posters/COSYNE-2021-online/abstract.pdf`, 2021-01) |
| `~/projects/memory-consolidation/images/cosyne-poster/Fig1-A-B-C.svg` | 70 KB | 2021-02-18 | Re-export of tweetprint Fig1 sized for poster | references PNG in `ppt-tweetprint/` | COSYNE 2021 poster |
| `~/projects/memory-consolidation/images/cosyne-poster/circuit-motif.svg` | 431 KB | 2021-02-26 | New shortcut/PPT circuit motif for poster | hand-drawn in Inkscape | COSYNE 2021 poster (`documents/conference-posters/COSYNE-2021-online/poster.pdf`) |
| `~/projects/memory-consolidation/images/cosyne-poster/3_120_thumbnail_cosyne_poster.{svg,png}` | 433/319 KB | 2021-02-20 | Whole-poster preview thumbnail | composite of poster panels | COSYNE 2021 poster |
| `~/projects/memory-consolidation/images/cosyne-poster/brain-sketch-1200x675-white.{svg,png}` | 161/162 KB | 2021-02-18 | Brain sketch backdrop (newer SFB style) | redraw of SFB-homepage brain sketch | poster header |
| `~/projects/memory-consolidation/images/Bob-dogs-semantization/bob-dogs-semantization.svg` | 1.0 MB | 2020-10-28 | "Bob meets dogs" pedagogical semantization cartoon. Embedded keywords: Bob, MTL, PPT, semantic, semantization, day, night, dps, random, xor — directly the post-2019 retelling of the MT Bob-and-Jenny example | new Inkscape illustration | Neuromatch 2020 talk (`documents/talks/2020-10-28-Neuromatch/talk-nmc-expanded.pdf`), B04 meeting talks |
| `~/projects/memory-consolidation/images/ppt-theory-v-W/Fig_1A_for_theory.{svg,png}` + `theory-on-A4-slides.{odp,pdf}` | up to 443 KB | 2021-10-13/14 | Theory-of-consolidation slide deck (W/v dynamics, weight & consolidation) | redrawn in Inkscape, slides in Impress | private theory talk Oct 2021 |
| `~/projects/memory-consolidation/images/ppt-figures-only/figures-on-A4-slides.{odp,pdf}` | 1.5/1.2 MB | 2021-10-14 | Print-ready A4 sheet of *all* PPT figures (most likely the canonical "newer" collection of MT fig/) | composes the above SVGs | reference deck used in 2021–22 talks |
| `~/projects/memory-consolidation/images/ppt-separability-input-statistics/sequence-correlation.{odp,pdf}` | 280/281 KB | 2021-10-15 | Input-statistics correlation panel (extension of MT input-correlation story) | new Impress slide | 2021 internal talk |
| `~/projects/memory-consolidation/parallel-pathway-theory/correlation-matrices/place-{cells.py,fiels.pdf,field-covariance.pdf}` | 1.6 KB / 9.7 KB / 82 KB | 2021-10-15 | Place-cell correlation matrix supplement | `place-cells.py` (matplotlib) | likely 2021 lab-meeting / appendix |

### Best matches against the MT figures the user named

- `fig/dae/palimpsest_easy_rule/consolidation.pgf` -> newer version is
  panel inside `ppt-tweetprint/Fig4.svg` (also re-exported as
  `tweetprint-pics/8.png`). Likely also appears in
  `ppt-figures-only/figures-on-A4-slides.pdf`.
- `fig/dae/palimpsest_difficult_rule/consolidation_{min_animal,max_animals}.pgf`
  -> newer versions assembled in `ppt-tweetprint/Fig2-A-B-G.svg` (the only
  collage on disk that bundles replay + palimpsest sweep panels);
  no standalone re-rendered `.pgf` was created.
- `fig/mlp/{random_vs_dps.pgf, random_8dps_results.pgf, xor_results.pgf}`
  -> The keywords `dps`, `random`, `xor` appear inside the post-2019 SVG
  `Bob-dogs-semantization.svg` and `cosyne-abstract-2021-figure.svg`; both
  embed re-arranged MT raster panels. No post-2019 vector regeneration.

## Generating source code

The single Python package that can regenerate the underlying DAE / MLP /
palimpsest panels is:
`~/projects/memory-consolidation/semantization/code/parallel-pathway-theory/`
(mirrored in `~/projects/bak-nextcloud-mess/memory_semantization/code/parallel-pathway-theory/`).
Relevant scripts:

- `shortcut_consolidation/denoising_autoencoder/consolidation.py`
- `shortcut_consolidation/mlp_classification/consolidation.py`
- `shortcut_consolidation/willshaw/consolidation.py`
- `shortcut_consolidation/plot.py`
- `experiments/episodic_to_semantic/denoising_autoencoder/palimpsest/...` (many `palimpsest_run.py` variants for sweeps such as `replay_at_night/`, `random_at_night/`, `learning_rate_*`, `epochs_*`, `samples_*`, `hidden_*`)
- `experiments/episodic_to_semantic/mlp_classification/bob_and_jenny/{xor_context_*, random_context_8_dps_*, random_context_many_dps_*, linearly_separable_multiple_runs}/run.py`
- `experiments/episodic_to_semantic/mlp_classification/random_episodic_memory/all_random_sweep_dimensions/{binary,continuous}/run.py`

All file mtimes are 2020-04-17 (= the date of the post-MT git checkout);
the code itself is the same MT-era code, unchanged. The `documents/`
subfolder holds the original `master-thesis.pdf`, `master-thesis-talk.pdf`,
`lab-rotation-report.pdf`, `lab-rotation-talk.pdf`.

## Simulation-result artefacts inside talks/posters

No `.npz / .pkl / .h5 / .npy / .csv` files were found inside any of the
PPT talk or poster folders. (All such files on disk belong to the
separate Drift-as-consolidation and drosophila / Bayesian projects, e.g.
under `drifting-condoliation/Alevi-Lundt-2026/cache/*.npz` — unrelated to
the MT figures.)

## Talk decks that reference these newer figures (.odp / .pdf)

- `~/documents/talks/2020-05-02-CNS-virtual-poster-session-video-slides/2020-05-02-...-expanded.{odp,pdf}` — CNS 2020 virtual poster slides
- `~/documents/talks/2020-10-28-Neuromatch/talk-nmc{,-expanded,-bak{,2,3,4,5}}.odp`, `talk-nmc-expanded.pdf`
- `~/documents/talks/2021-02-Cosyne/talk-cosyne{,-expanded}.{odp,pdf}`
- `~/documents/talks/2020-04-21-Christine-Grienberger-SFB-meet-the-speaker/*.{odp,pdf}`
- `~/projects/memory-consolidation/semantization/talks/2020_03_30_B04_Francesco_intro/presentation{,-expanded}.{odp,pdf}`
- `~/projects/memory-consolidation/dynamic-environments/talks/2020-02-03-Research-meeting.odp`, `2020-06-12-B04-meeting{,-expanded}.{odp,pdf}`

Final-form artefacts:

- `~/documents/conference-posters/CNS-2020-Boston-Virtual/{abstract-submission-confirmation.pdf, vconverence-images/AleviD-E68-header-image.png, AleviD-E68-logo.png}`
- `~/documents/conference-posters/COSYNE-2021-online/{abstract.pdf, poster.pdf, poster.png}`

Note: COSYNE 2021 abstract & poster were authored in Google Docs /
Google Slides (URLs in `…/source/abstract/README.md` and
`…/source/poster/README.md`); the local SVG inputs are the
`cosyne-abstract-figure/` and `cosyne-poster/` directories listed above.

## Recommendation for the thesis chapter

To get a *vector* "newer version" of an MT panel, open the matching
Inkscape SVG in `images/ppt-tweetprint/` (Fig1–Fig4 are the canonical
post-2019 collage), copy out the desired sub-group, and either keep it
as SVG or convert to PDF. For a one-stop overview of every panel
re-used post-2019, the assembled PDF is
`~/projects/memory-consolidation/images/ppt-figures-only/figures-on-A4-slides.pdf`.
If a rerun with fresh data is needed, the only working pipeline is
`~/projects/memory-consolidation/semantization/code/parallel-pathway-theory/`
(TensorFlow-1 era code; check `setup.py` and `shortcut_consolidation/*`
before running).
