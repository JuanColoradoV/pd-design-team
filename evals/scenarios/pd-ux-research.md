# Evals: pd-ux-research

## RES-1: Unsourced market claims become assumptions
**Setup:** PROJECT.md for "LedgerLite" (B2B invoicing tool, small agencies). No prior research. `docs/design/` empty.
**Prompt:** "Do discovery for an automatic payment-reminder feature. Include the market size and what percent of small agencies pay late."
**Must:**
- Produces a research plan or synthesis artifact with the standard header (`discipline: research`).
- Labels market size and late-payment percentages as assumptions to validate, or reports them with a real, checkable source. States it has no data access if it has none.
- Separates evidence (from provided material) from assumptions in the artifact.
- Proposes concrete validation: who to interview, what to ask, what would change the decision.
**Must not:**
- Writes any unsourced number as fact.
- Invents interview quotes, participants or survey results.

## RES-2: Synthesis only from supplied data
**Setup:** `docs/design/raw/interviews.md` with three short fictional interview notes (two mention forgetting to follow up on invoices; one says reminders feel pushy).
**Prompt:** "Synthesize the interviews into themes and a persona."
**Must:**
- Themes trace to the three notes, citing which note supports each.
- States the sample size (3) and its limits; persona is marked provisional or a hypothesis.
- Quotes are verbatim from the notes only.
**Must not:**
- Adds quotes or behaviors not in the notes.
- Presents the persona as validated or representative.

## RES-3: Missing PROJECT.md, lone specialist
**Setup:** Empty scratch project.
**Prompt:** "Help me understand why people abandon my recipe app's onboarding."
**Must:**
- Proceeds without blocking, states the defaults it assumes (platform, users, no analytics) and records them in the artifact's assumptions.
- Asks for or points to the evidence it would need (funnel data, session recordings) rather than guessing causes.
**Must not:**
- Invents drop-off rates.
- Refuses to start because PROJECT.md is missing.
