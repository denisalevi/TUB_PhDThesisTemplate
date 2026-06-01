# PPT chapter — master-thesis integration plan

**Session date:** 2026-05-28
**Status:** planning only. Nothing in the chapter has been edited.
**Open subagent investigations:** code archaeology + newer-figures search (both
read-only, both running in the background; reports will land at:
- `chapter_PPT/_archaeology_report_code.md`
- `chapter_PPT/_archaeology_report_figures.md`

Resume by reading those two reports plus this file.

---

## 1. The gap to fill

The PhD PPT chapter already promises semantization in its **abstract** and
**introduction**:

> "This transfer can further lead to the semantization of episodic memories
> when the pathways learn with different learning rates. A hierarchy of
> parallel pathways with distributed learning rates gives rise to long-term
> memory retention in form of a power-law decay of memories, **together with
> spatial gradients of memory semantization across the hierarchy of pathways**."

The current results deliver the power-law decay (Fig 4, hierarchical) but the
**semantization / spatial-gradient promise is never delivered**. That's the
gap the master thesis fills.

## 2. Master thesis content — what's there

Folder: `/home/denis/writing/manuscripts/master_thesis/`. AGENTS.md was
written there in this session.

Two result chapters:

- `tex/mlp_framework.tex` ("Forgetting of episodic detail through linearization") — Hyp 1.
- `tex/dae_framework.tex` ("Semantization through memory consolidation and a role for replay") — Hyp 2 + replay.

Plus `tex/discussion.tex` (1081 lines, 5 sections — see AGENTS.md).

### What is actually demonstrated in the MT

- **MLP §"Forgetting episodic detail"** (`mlp_framework.tex:1086`):
  shortcut-pathway accuracy on random episodic detail drops with dataset
  size. This is a **capacity-driven detail-loss** demonstration
  (Vapnik / linear-separability).
  → Hyp 1 (linearization → detail loss) is empirically shown.
- **DAE §"Semantization through memory consolidation"** (`dae_framework.tex:922`)
  and **§"Complex statistical regularities and a role for replay"**
  (`dae_framework.tex:1108`): day/night consolidation. Shortcut pathway, with
  slow learning, learns linear rule as semantic memory; rule does not decay
  with consolidation cycles. Replay outperforms random reactivations and
  becomes necessary when rule complexity exceeds the multisynaptic teacher's
  generalization capacity.
  → **Slow-plasticity → semantization is shown.**
  → **Capacity → semantization is NOT shown.**

The MT itself concedes this in `discussion.tex:184-189`:

> "the mechanism which led to semantic generalization was different from the
> hypothesized one, namely increased generalization due to slow plasticity
> instead of decreased capacity. The influence of the decreased capacity on
> generalization remains to be investigated in the future."

So for the PhD chapter: **drop the original two-hypothesis framing**. Just
present the DAE consolidation result as "slow plasticity in the shortcut
yields semantization", and let the existing chapter discussion sentence
about "the consolidated memory is in essence a linear approximation ... could
underlie semantization" carry the linearization-angle conceptually (it
already does — no new sim needed for that claim).

## 3. User decisions made this session

| Question | Decision |
|---|---|
| Number of new figures in the chapter | **1 figure** (semantization + replay). Layout sketch in §6. |
| Two-hypothesis framing | **Drop**. Present as continuation, no hypothesis re-litigation. |
| Spatial-gradient discussion text | **Option B — full mini-subsection** (drafted in §7). |
| Cleanup of reviewer-bloat in existing chapter | **Defer this round.** Only touch the chapter where the new content lands. |
| Hydra | **Do not touch.** Investigation must be cloud-of-state across the GitHub repos + local + read-only descriptions of hydra. |
| Newer figures | **Search locally**, don't modify. User has confirmed they exist in posters/talks/abstracts dirs. |

## 4. Style — what we're writing in

Style guide was extracted from `chapter_engram_dynamics/` (primary clean
voice) and `chapter_PPT/` (mostly same, with reviewer-imposed bloat to
avoid). Key points to apply:

- First person plural ("we"). Active declarative.
- Medium-length sentences. Paragraphs 3–6 sentences, one idea each.
- Results subsections: motivation sentence → claim → figure-anchored
  evidence → 1-sentence summary lift ("Thus..." / "Hence...").
- Math sparse and short; derivations to supplement.
- Discussion: themed paragraphs / subsections; limitations embedded in the
  relevant theme, not quarantined.
- Avoid: bulleted requirement lists in discussion; "First… Second…" scaffolding
  for short lists; defensive throat-clearing; over-citation strings;
  paragraphs that re-do the previous paragraph with one more concession.

The cleanest reviewer-bloat examples in the current chapter (which we are
NOT touching this round, but are flagged for later):
- `results.tex:34-38` (the HS/RK margin-note paragraph with explicit reviewer
  trail).
- `results.tex:51-61` (three commented-out near-duplicates plus the live
  "two key predictions" paragraph).
- `results.tex:85` (TODO note about correlation argument).

## 5. What the current PPT chapter delivers (recap)

Read in this session: `main.tex`, `abstract.tex`, `introduction.tex`,
`results.tex` (171 lines, 4 subsections), `discussion.tex` (75 lines, 5
subsections). Methods + supplementary not re-read this session.

Results subsections currently:
1. "A mechanistic basis for systems memory consolidation"
2. "Consolidation of spatial representations"
3. "Consolidation of place-object associations in multiple hippocampal stages"
4. "Consolidation from hippocampus into neocortex by a hierarchical nesting
   of consolidation circuits"

Discussion subsections currently:
1. "Theory requirements and predictions" (the bulleted list — flagged as
   reviewer-bloat to clean later)
2. "What limits systems memory consolidation?" (already contains the
   linearization → semantization sentence we will lean on)
3. "Relation to phenomenological models of systems consolidation"
4. "Consolidation of non-declarative memories"
5. "Limitations of the model and future directions"

## 6. New results subsection — figure layout (1 figure, panels A–D)

Insert as new results subsection between current §4 ("Hierarchical nesting
…") and the chapter summary. Working title: *"Semantization through
consolidation in parallel pathways"* (refine later).

```
+----------------------------------------------------------+
|        Fig X. Semantization through consolidation        |
|              in the shortcut motif                       |
+----------------------------------------------------------+
| A. Schematic         | B. Easy rule (e.g. 2 species)     |
|                      |   reconstruction accuracy of      |
|   day:               |   the semantic rule (species)     |
|   episodes -> MLP    |   over consolidation cycles       |
|   (multisynaptic,    |                                   |
|   high cap, fast)    |   --- multisynaptic               |
|                      |   --- shortcut, random reactiv.   |
|   night:             |   --- shortcut, replay            |
|   { random | replay} |                                   |
|   -> linear shortcut |   (both shortcut conditions       |
|   (low cap, slow)    |   reach perfect generalization;   |
|                      |   small replay advantage)         |
+----------------------+-----------------------------------+
| C. Complex rule      | D. Rule complexity sweep          |
|   (e.g. 32 species,  |    (final semantic accuracy vs    |
|   many breeds)       |     #breeds per species, last 100 |
|                      |     cycles)                       |
|   same 3 lines       |                                   |
|   as B               |   multisynaptic: partial then     |
|                      |     drops                         |
|   only replay still  |   shortcut+random: drops with     |
|   learns the rule    |     multisynaptic                 |
|                      |   shortcut+replay: flat near 1    |
+----------------------+-----------------------------------+
```

Direct repackaging of MT figures:
- B: `fig/dae/palimpsest_easy_rule/consolidation.pgf` (MT Fig
  `res_dae_cons_easy` A and B → consolidated into one panel)
- C: `fig/dae/palimpsest_difficult_rule/consolidation_max_animals.pgf`
- D: panel E of MT Fig `res_dae_cons_difficult` (rule-complexity sweep)
- A: new schematic (similar to the existing chapter's hierarchical
  schematic, but for single day/night cycle)

Memory-lifetime panels (MT `res_dae_cons_easy` panels C/D) → push to
supplementary; the no-decay-with-consolidation claim is already visible in B
and C.

**Figure-source caveat**: the 2019 MT plots are outdated; user has produced
newer (similar) figures for posters and talks. Subagent 2 is searching for
them. Swap-in the newer plots when found.

## 7. Discussion text — Option B (chosen) draft

To be inserted as a new subsection in the discussion, between the existing
§"What limits systems memory consolidation?" and §"Relation to
phenomenological models…". Verbatim draft, to be edited in the chapter
later:

> **Spatial gradients of semantization across the consolidation hierarchy.**
> The combination of semantization in single pathways (Fig~\ref{fig:semantization})
> and the hierarchical iteration of the PPT
> (Fig~\ref{fig:hierarchical}) predicts a spatial gradient of memory
> content along the cascade. Pathways closer to the hippocampus retain more
> episodic detail; later pathways, where learning rates are lower, retain
> only the statistical regularities of the original associations as semantic
> content. The hierarchy therefore produces two co-existing gradients in
> opposite directions: a sharp decay of episodic detail and a gradual
> buildup of semantic content with distance from the hippocampus.
>
> This dual gradient offers a mechanistic reading of several otherwise
> contradictory observations. The trace transformation theory
> \cite{Winocur2010, Winocur2011} postulates that consolidation leaves
> episodic memories hippocampus-dependent while extracting their gist into
> neocortex; the PPT recovers this by setting the early shortcut learning
> rates high enough to store a limited amount of episodic detail and the
> later rates low enough that only statistical regularities survive. In the
> same framework, bilateral hippocampal lesions need not abolish all
> personal memory because some episodic content will have already migrated
> into the first one or two shortcuts (the perforant path being a natural
> candidate; cf.~\cite{Lux2016}). Likewise, the discrepancy between
> hippocampus-only retrograde amnesia (~5 years) and broader
> medial-temporal-lobe damage (decades) reported in \cite{Bayley2006} is
> consistent with a steeply decaying episodic-content gradient over a short
> stretch of the cascade. These hypotheses are speculative but, importantly,
> anatomically grounded: they predict that *which* shortcut is lesioned
> matters as much as how much hippocampal tissue is removed.

Two paragraphs. Cites: Winocur2010, Winocur2011, Lux2016, Bayley2006.
References Fig X (the new semantization figure) and Fig 4 (hierarchical).

## 8. Other planned discussion edits (smaller)

To do in the same pass:

1. **Abstract** — append one sentence: *"Beyond memory transfer, we further
   show that consolidation through this circuit semantizes memories, with
   replay being necessary for the extraction of complex statistical
   regularities."* (Wording draft only; refine.)
2. **Introduction** closing paragraph — extend the "In the following
   sections, we will show..." sentence to mention semantization + replay
   alongside the lesion-study, nonlinearity, hierarchical-iteration items.
3. **Results §4 closing** ("Hierarchical nesting…") — add a one-sentence
   pivot to the new subsection (the current ending on "reduction of delay"
   already works as a natural lead-in).
4. **Discussion §"What limits systems memory consolidation?"** — extend the
   existing semantization paragraph with one sentence that the new
   simulations confirm semantization in the shortcut and that the observed
   mechanism here was slow plasticity; capacity-driven semantization remains
   open.
5. **Discussion §"Relation to phenomenological models of systems
   consolidation"** — **add a new subsection** "Relation to recent
   computational models of selective consolidation" comparing PPT-semantization
   to GoCLS (Sun et al. 2023) and recall-gated consolidation (Lindsey et al.
   2024). Verbatim draft in §8a below.
6. **Discussion §"Limitations and future directions"** — add a one-paragraph
   replay note: replay was shown to be *necessary*, not merely beneficial,
   when rule complexity exceeds the indirect-pathway teacher's
   generalization capacity. Connect to one-shot hippocampal acquisition
   (Lee2015).
7. **Chapter summary** — one sentence acknowledging the semantization story
   before the "Part II…" cross-reference.

### 8a. New discussion subsection — Relation to recent computational models of selective consolidation

Position: insert after the existing §"Relation to phenomenological models
of systems consolidation" subsection, before §"Consolidation of
non-declarative memories".

Verbatim draft (to be edited in the chapter):

> **Relation to recent computational models of selective consolidation.**
> Two recent theoretical proposals approach the question of memory
> selectivity from angles that contrast instructively with the parallel
> pathway theory. Sun et al.\ \cite{Sun2023} introduced
> *generalization-optimized complementary learning systems* (Go-CLS), in
> which the amount of cortical consolidation is regulated to maximise the
> generalization performance of a linear cortical student trained on
> hippocampal reactivations. Unpredictable memories are not consolidated
> because doing so would harm generalization; predictable memories are
> consolidated until further reactivation begins to overfit cortical
> weights to encoding noise. Lindsey et al.\ \cite{Lindsey2024} proposed
> *recall-gated consolidation*, in which the rate of plasticity in a
> long-term memory pathway is gated by the recall strength of a
> short-term pathway. Reliable memories accumulate short-term recall over
> repeated reinforcement and pass the gate; spurious one-off events do
> not. Both frameworks render consolidation **selective at the level of
> individual memories** — Go-CLS by an upstream optimization-derived
> stopping rule, recall-gated consolidation by an explicit downstream
> plasticity gate driven by a global recall signal.
>
> Our parallel pathway theory shares with these proposals the prediction
> that consolidation selectively transfers a subset of memory content from
> hippocampus to cortex, but the *mechanism* and the *granularity* differ.
> In the PPT, every memory acquired in the indirect pathway is exposed to
> the shortcut by Hebbian plasticity, but the shortcut's reduced
> expressivity and slow plasticity together act as a downstream filter
> that retains only the linearly approximable, statistically regular
> component of each association. Selection is therefore *architectural*
> rather than *gated*, and operates *within* each memory rather than
> *between* memories. The PPT predicts a cortical trace of every memory,
> consisting of its generalizable component; the gating accounts predict
> that some memories leave no cortical trace at all. Distinguishing the
> two regimes experimentally requires assessing whether the cortical
> contribution to recall is graded by predictability or reliability across
> a continuum of memories, or instead reflects a sharp gate that
> excludes some memories entirely.
>
> The proposals are not mutually exclusive. A regulated gate at the
> hippocampal source --- as in recall-gated consolidation or in
> early-stopping implementations of Go-CLS --- could control *which*
> reactivations enter the shortcut, while the shortcut's architecture
> further determines *what survives* of each consolidated reactivation.
> Indeed, Lindsey et al.\ identify Remme et al.\ \cite{Remme2021} as a
> "copying"-style consolidation model lacking gating, but our results show
> that the shortcut mechanism does already implement a form of
> non-trivial content selection through linearization and slow plasticity
> --- a different selection axis from those proposed by Go-CLS and
> recall-gated consolidation, and one that operates concurrently with
> them rather than in competition.
>
> Replay's role differs across the three frameworks in informative ways.
> In Go-CLS, replay implements the regulated reactivation count whose
> length is optimised; in recall-gated consolidation, selective replay of
> familiar patterns is one of several possible implementations of the
> gate. In our framework, replay is not regulatory but *informational*: it
> is necessary specifically when the indirect-pathway teacher cannot
> itself generalize the rule from a single day's memories
> (Fig.~\ref{fig:semantization}\,C). Random reactivation suffices when the
> teacher has already extracted the structure; replay becomes essential
> only when the structure can be learned only by averaging over the
> specific stimuli that exemplify it. This complements rather than
> contradicts the gating role of replay in the other proposals.

References to add to `.bib`:
- `Sun2023`: Sun, W., Advani, M., Spruston, N., Saxe, A. & Fitzgerald, J.E.
  (2023). *Organizing memories for generalization in complementary
  learning systems.* Nature Neuroscience 26, 1438–1448.
  DOI: 10.1038/s41593-023-01382-9
- `Lindsey2024`: Lindsey, J.W., Litwin-Kumar, A., Gjorgjieva, J. & Frank,
  M.J. (2024). *Selective consolidation of learning and memory via
  recall-gated plasticity.* eLife 12, RP90793.
  DOI: 10.7554/eLife.90793

## 9. NOT doing this round

- Cleanup of reviewer-bloat in existing chapter (HS/RK margin-note paragraph,
  commented-out near-duplicates, TODO notes). Listed in §4 for a later pass.
- Hyp-1 detail-loss figure. Decided: skip, conceptual linearization claim is
  already carried by the existing discussion sentence.
- Spatial-gradient simulation. User estimates a week of work to splice
  DAE-style consolidation into a cascade. Not in scope. Subagent 1 will
  confirm whether any existing code has a cascade model.

## 10. Hydra findings (from the hydra subagent that ran)

Do NOT touch hydra. This is description only.

- Repo on hydra is named `shortcut_consolidation_model`, NOT
  `parallel-pathway-theory`. Per the user, the GitHub
  `shortcut_consolidation_model` repo is **deprecated**, with code
  integrated into `parallel-pathway-theory`. Hydra was never updated to
  reflect that move.
- `~/projects/memory_consolidation/shortcut_consolidation_model/` on hydra:
  active working copy that produced all thesis sims. Git log ends
  2018-08-20 (`4635d24` "Fix typo in setup.py"). On top: 14 modified
  tracked files + many untracked dirs:
  - `experiments/episodic_to_semantic/denoising_autoencoder/multiple_runs_thesis/`
  - `experiments/.../palimpsest/thesis_sweeps/{person32_sweep_animals, person24, person32_animal128/sweep_learning_rates, sweep_num_episodes}`
  - several `multiple_runs_snep*` variants
  - **None ever pushed to GitHub.**
- `~/model_dir/` on hydra: 972 subdirs, Dec 2018 – Jan 2019, parameterized
  by `direct_learning_rate`, `indirect_learning_rate`, `num_hidden`,
  `num_episodes_day`, `num_episodes_night`, `num_night_epochs`,
  `num_day_epochs`. TF event files from cognition00–12 cluster nodes.
- `~/projects/memory_consolidation/shortcut_consolidation_model_bak/` on
  hydra: clean backup (no post-thesis changes), newest files 2019-10-27,
  includes original `snep/` package.

### 10a. Code archaeology results (subagent 1, complete)

Full report at `_archaeology_report_code.md`. Headline findings:

1. **The two GitHub repos are byte-identical mirrors.**
   `parallel-pathway-theory.git` and `shortcut_consolidation_model.git`
   share the same 164 commits across both branches. The "deprecated,
   integrated" framing is technically true but understated: PPT was
   created by duplicating SCM. They are not separate codebases.
2. **Two branches on each repo:**
   - `master` (tip `79b7f17`, 2020-04-17) — the full thesis code.
   - `diverged_commits` (tip `9ff715d`, 2019-12-26) — a sparser branch
     split off on 2018-08-31. README is an empty file.
   - Merge base: `9a34c85`.
3. **Local folder ≈ PPT `master`.** Exactly one file differs:
   `palimpsest/multiple_runs/single_run.py` is on `master` but missing
   locally. No other drift. **For the chapter, treat the local folder as
   the canonical code.**
4. **Hydra HEAD `4635d24` is reachable only on `diverged_commits`, not on
   `master`.** Hydra's working tree therefore has post-HEAD modifications
   + untracked thesis dirs layered on top of the **sparser** branch — a
   different ancestor than the code on master / local.
5. **Hydra's uncommitted thesis work was never pushed.** None of
   `multiple_runs_thesis/`, `palimpsest/thesis_sweeps/...`, or the
   `multiple_runs_snep*` variants exist in any GitHub branch or in the
   local folder. **Hydra is the only place that work exists.**
6. **Subagent recommendation (no action taken)**: treat PPT `master`
   (≈ local) as canonical thesis code. To preserve the unpushed hydra
   sweeps, rsync hydra's working tree into a new branch of PPT. Archive
   SCM since it duplicates PPT.

**Implication for the chapter**: the local code is fine to work from for
text references / methods reproductions. But the **data and sweep configs
that produced the thesis figures live only on hydra**, anchored to the
sparser branch — so the §11 "rsync from hydra" path is the only way to
recover the data without re-simulation. Re-simulation would also work,
since master / local has the simulation code; but exact reproduction needs
hydra's untracked configs.

## 11. Fast path to figures — rsync + replot

A key finding from this session: **the master-thesis `plotting/` folder is a
working pipeline**. Each subdir contains:

- `get_data.sh` — `rsync` from hydra paths.
- `plot.py` — reads CSVs (`evaluation_results_df.csv`,
  `evaluation_results_over_dps_*.csv`) or numpy files, calls helpers in
  `plot_utils.py`, writes `.pgf` into `../../../fig/...`.

Sample paths the `get_data.sh` scripts pull from:

- `~/projects/memory_consolidation/shortcut_consolidation_model/experiments/episodic_to_semantic/denoising_autoencoder/palimpsest/single_run/specific_runs_thesis/palimpsest_showcase/easy_rule`
- same `.../difficult_rule`
- `/cognition/home/.../palimpsest/multiple_runs/replay_at_night/thesis_sweeps/*`
- `/cognition/home/.../palimpsest/multiple_runs/random_at_night/thesis_sweeps/*`

Files included by rsync filter: `*.py`, `*.np`, `*.npz`, `*.csv`,
`.params/*`, `*last_run_git_state/*`, `*.png`.

**No raw simulation results (`.npz`, `.pkl`, `.h5`, `.npy`, `.csv`) currently
exist in `/home/denis/writing/manuscripts/master_thesis/`** — only the
`.pgf` outputs survive in `fig/`. So if we want to re-plot, we need the data
back. Two options:

1. Re-run `get_data.sh` from hydra (just rsync, no code execution on hydra).
   Result lands locally; `plot.py` is then runnable.
2. Find an existing local copy of those results. May already live in
   `/home/denis/projects/memory-consolidation/semantization/code/parallel-pathway-theory/`
   under analogous `experiments/.../palimpsest/...` paths. Subagent 1 is
   checking.

If newer (post-2019) figures are found by subagent 2 with accompanying
data + scripts, prefer those over re-plotting the MT figures.

## 12. Running subagents (background)

- **Code archaeology** (`a92693e3cdd4282d8`): clone both GitHub repos,
  enumerate branches, diff matrix vs. local folder, confirm whether hydra's
  uncommitted work made it into `parallel-pathway-theory`, write report to
  `chapter_PPT/_archaeology_report_code.md`. Read-only, /tmp clones cleaned
  up.
- **Newer figures** (`ad91181ce1c351ee6`): scan posters/talks/abstracts
  dirs for post-2019 figures referencing palimpsest/semantization/replay,
  cross-reference to source scripts, write report to
  `chapter_PPT/_archaeology_report_figures.md`. Read-only.

Both should land while the user is away.

## 13. Decision points pending — next session

1. **Pick the memlife source for Panel A**: hardrule (32×64) or easyrule (2×2).
   Both versions produced as `chapter_fig_semantization__memlife_from_{hardrule,easyrule}.pdf`
   in `hydra-snapshot/regenerate/output/`.
2. **Confirm panel layout, axes, and title style** before generating the
   final chapter `.pgf` (current panels: A=memlife, B=32×64 complex rule
   replay vs random, C=2×2 simple rule).
3. **Caption text** for the new figure (TBD — short, drift-chapter style).
4. **Whether to keep capacity wording** even though only slow plasticity
   was demonstrated. Current plan: drop capacity-→-semantization claim,
   keep slow-plasticity-→-semantization, mention the linearization claim
   only via the existing discussion sentence about linear approximation.
5. **Drafting order** for the chapter edits (when you say go):
   (a) Place final `.pgf`/`.pdf` figure into `chapter_PPT/figures/` (name
       and dimensions to confirm),
   (b) New results subsection text (`results.tex`),
   (c) Discussion §"Spatial gradients of semantization across the
       consolidation hierarchy" (option B, already drafted in §7),
   (d) **New** discussion §"Relation to recent computational models of
       selective consolidation" (Sun 2023 + Lindsey 2024, drafted in §8a),
   (e) Small edits to abstract, intro, current results §4 closing, current
       discussion §"What limits…", §"Limitations and future directions",
       chapter summary,
   (f) Add `Sun2023` and `Lindsey2024` bibtex entries.

## 14. Status summary (most-recently completed work)

- **Hydra snapshot** at `/home/denis/projects/memory-consolidation/hydra-snapshot/`:
  ~1.4 GB of PNGs, CSVs, and Python scripts pulled, plus a separate
  ~3.3 GB pull of all `palimpsest_accuracies.npz` time-series files.
  Total ~4.7 GB. No hydra-side modifications.
- **Code archaeology done**: both GitHub repos (`parallel-pathway-theory.git`
  and `shortcut_consolidation_model.git`) are byte-identical mirrors; two
  branches each (`master` 2020-04-17 + `diverged_commits` 2019-12-26);
  hydra's HEAD is on `diverged_commits` and its uncommitted thesis-sim
  dirs (`multiple_runs_thesis/`, `palimpsest/thesis_sweeps/...`) exist
  nowhere else. Full report at `_archaeology_report_code.md`.
- **Newer-figures archaeology done**: post-2019 figures used in
  posters/COSYNE/tweetprint are Inkscape SVG collages reusing MT-era
  raster panels. No new simulation reruns exist. Full report at
  `_archaeology_report_figures.md`.
- **Replot pipeline up**: `regenerate/replot.py` produces 49 individual
  2-panel figures (one per matched replay/random condition pair) into
  `regenerate/output/`. `regenerate/chapter_figure.py` assembles the
  3-panel candidate chapter figure in two memlife variants (hardrule and
  easyrule sources), with x-limits B=1000, C=400 per user input.
- **Comparison theory analyses done**: GoCLS (Sun et al. 2023) and
  recall-gated consolidation (Lindsey et al. 2024) fulltexts read; the
  three-way comparison is drafted in §8a above.

## 14. Cross-references in the workspace

- Master thesis content map and AGENTS.md:
  `/home/denis/writing/manuscripts/master_thesis/AGENTS.md`
- Existing chapter (the live one):
  - `/home/denis/writing/phd_thesis/overleaf/chapter_PPT/main.tex`
  - `/home/denis/writing/phd_thesis/overleaf/chapter_PPT/abstract.tex`
  - `/home/denis/writing/phd_thesis/overleaf/chapter_PPT/introduction.tex`
  - `/home/denis/writing/phd_thesis/overleaf/chapter_PPT/results.tex`
  - `/home/denis/writing/phd_thesis/overleaf/chapter_PPT/discussion.tex`
- Drift chapter (style reference):
  `/home/denis/writing/phd_thesis/overleaf/chapter_engram_dynamics/`
- Local PPT-code folder (no git):
  `/home/denis/projects/memory-consolidation/semantization/code/parallel-pathway-theory/`
- GitHub repos (do not push):
  - `git@github.com:denisalevi/parallel-pathway-theory.git`
  - `git@github.com:denisalevi/shortcut_consolidation_model.git` (deprecated)
