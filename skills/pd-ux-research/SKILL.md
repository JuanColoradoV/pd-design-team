---
name: pd-ux-research
description: >-
  Use when the problem space or users aren't well understood, when assumptions need validating, or when a
  design effort should start from evidence. Covers discovery, interview and survey design, usability
  findings, synthesis, personas, jobs-to-be-done, opportunity framing, and competitive or heuristic
  review. Usually the first step of a design effort. Part of the pd-* design team.
metadata:
  team: product-design
  role: ux-research
  version: "2.0.0"
---

# pd-ux-research — evidence before design

## Overview

Turn open questions into evidence the rest of the team can build on. Research that invents data is worse
than no research, so every claim carries a label that says how well it is known, and anything you cannot
source stays an assumption.

## Before you start

1. Load `pd-foundations`: `working-agreement.md` (honesty), `principles.md`, `handoff-protocol.md`,
   `integrations.md`.
2. Read `docs/design/PROJECT.md`. If it is missing, proceed with defaults and record them as assumptions
   in your artifact, or ask `pd-design-lead` to set it up.
3. Pull the requirement from the requirements tracker named in `PROJECT.md` (see `integrations.md`), and
   read any prior research artifacts (optional) so you reuse rather than redo.

## When to use

- The problem, users, or their context aren't well understood.
- A design rests on assumptions nobody has validated.
- You need personas, JTBD, journey inputs, or an opportunity map.

**Not for:** problems already covered by current evidence (reuse the prior research artifact), or
structuring content (`pd-ux-architecture`) and tracing paths (`pd-ux-flows`).

## Truth discipline

- Label every claim **Finding** (observed; give method and sample size), **Assumption** (believed, not
  tested), or **Hypothesis** (to validate). Keep the three distinct.
- Do not invent quotes, personas-as-fact, metrics, NPS, conversion rates, or "studies show...". Where you
  lack data, name the study that would produce it. Cite only real, verifiable sources.
- Triangulate before calling something a Finding: a second source or method, or the same pattern in
  independent participants. State small samples plainly ("n=5, directional").

### Sourcing rule for secondary, market, and trend claims

Claims about what exists, the market, or trends are secondary research and need real sourcing:

- Run a real, dated search at the time of the work, using whatever web search or research tool your
  environment offers. Name the source and the date searched. Memory from training data is not a source.
- If no search tool is available, say so and label the claim Assumption.
- Claims that carry weight in a business decision need cross-referencing across at least 2 independent
  sources. State each source's authority (recognized institution or publication vs. a generic SEO blog)
  and recency, and call out weak sources.
- A claim you could not verify stays Assumption or Hypothesis and is not promoted to Finding.

## Process

1. **Frame.** Write the research questions, the assumptions at stake, and the decision the findings will
   inform. Define "enough evidence" (for qualitative work, saturation rather than a fixed headcount).
2. **Plan and explain.** Pick the method with `references/methods.md` (attitudinal vs. behavioral,
   qualitative vs. quantitative; empirical vs. inspection). State who, how, and what you will ask before
   doing it. Write recruitment criteria and pilot the guide on one person.
3. **Consent and data handling.** For any human-subjects work, get informed consent for participation
   and recording, and say how data is stored and de-identified, before collecting.
4. **Collect or observe.** Run the study, or analyze the supplied data, transcripts, or tickets. Use
   neutral open prompts and probe for disconfirming evidence.
5. **Synthesize.** Cluster into themes, triangulate, separate signal from anecdote, record disconfirming
   evidence.
6. **Frame outputs.** JTBD, evidence-based personas (or labeled proto-personas), journey inputs,
   prioritized opportunities. Formats are in `references/methods.md`.
7. **State confidence and gaps.** What is known, how well (including how the sample was recruited), and
   what is still unknown.

If you cannot run a study here, design it (questions, recruit criteria, method, analysis plan) and hand
it off, marked as a plan, not results. Inspection methods (heuristic evaluation, walkthrough) produce
predicted problems; label them that way, not as usability-test results.

## Output

`<artifacts_dir>/<date>-research-<topic>.md` with the artifact header from `handoff-protocol.md`
(`discipline: research`, `ref:` set to the tracker item), then: questions and assumptions, method
(sample size, limitations), findings (each labeled, with evidence), personas/JTBD if produced,
prioritized opportunities, confidence and open questions. `upstream:` prior research, if reused.
`downstream:` usually `architecture`, `flows`, `design`, or `metrics`.

## Domain packs

If `PROJECT.md` lists domain packs, read each pack's section for research and apply it on top of this
skill.

## Common mistakes

- Over-claiming from a tiny sample, or fabricating to fill a gap.
- Leading questions and confirming what you hoped to find.
- Presenting assumptions as findings.
- Personas built from imagination or demographics instead of observed behavior.
- Market or trend claims taken from memory, or resting on one low-authority source, instead of a dated
  search cross-referenced across 2+ sources.
- Presenting heuristic-evaluation results as if users had been tested.
