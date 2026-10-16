# Evals: pd-design-lead

## LEAD-1: Plan first, then route
**Setup:** `docs/design/PROJECT.md` for "Pantry", a recipe app (iOS + web, `design_system: {source: code, locations: [src/tokens/]}`, `design_tool: code-only`, `requirements: {tracker: github}`, `analytics: none`, `domain_packs: []`). `docs/design/INDEX.md` empty.
**Prompt:** "We want to add a weekly meal planner to Pantry. Take it from nothing to something engineering can build."
**Must:**
- Reads PROJECT.md and loads foundations before planning.
- Presents a plan (specialists, order, artifact each will write) and waits for the user's OK before running any specialist.
- Plan covers research or an explicit reason to skip it, flows, design, writing, QA, and handoff, and ends with `pd-ux-qa` before `pd-handoff`.
- Does not do discipline work itself (no wireframes, copy or metrics written by the lead).
- After approval, creates or updates `docs/design/INDEX.md` as work proceeds.
**Must not:**
- Starts routing or writing artifacts in the same turn as presenting the plan.
- Plans a Figma step or asks for a Figma file for a code-only project.
- Skips QA to save time.

## LEAD-2: Smallest pipeline for a small change
**Setup:** PROJECT.md for "LedgerLite", a B2B invoicing tool (web, `design_system: {source: code, locations: [src/components/]}`). `docs/design/` has an approved flows artifact and an approved `2026-03-04-design-invoice-send.md` that shows the error state.
**Prompt:** "The error on the invoice send form says 'Invalid input'. Make it say something useful."
**Must:**
- Recognizes a single-discipline request and routes to (or acts as) `pd-ux-writing` only, rather than the full pipeline.
- States briefly that the request is small and why research, flows and mocks are skipped.
- Proposed copy names what went wrong and how to fix it (and which field).
**Must not:**
- Proposes a multi-specialist plan, research, or a new flow for a copy fix.
- Invents the validation rules without saying they are assumed.

## LEAD-3: Missing PROJECT.md
**Setup:** Empty scratch project. No `docs/design/`.
**Prompt:** "Design a booking flow for a small yoga studio app."
**Must:**
- Notices PROJECT.md is missing and offers to create it from the foundations template with a few quick questions (or proposes stated defaults and asks for confirmation).
- Keeps the questions short (platforms, design system or none, requirements source, analytics, regulatory needs).
- Still presents a plan before routing.
**Must not:**
- Assumes Figma, Linear or Amplitude exist.
- Fires 10+ questions before doing anything.
- Starts specialist work with no profile and no stated assumptions.

## LEAD-4: Empty project, no design system
**Setup:** Empty scratch project with no `docs/design/` and no tokens or component library. The user confirms they have no design system and no tracker.
**Prompt:** "Design a settings screen for a new habit-tracker app, from scratch, including how it looks."
**Must:**
- Creates `PROJECT.md` with `design_system: {source: none, locations: []}` after a few short questions.
- Plans `pd-design-system-ops` first (provisional system with a named owner, written to `<date>-components-provisional-system.md` with status draft, and the user's agreement) before any `pd-visual-design` step.
- Then plans the normal pipeline against it: design, writing in parallel with visual, design-system, mocks, qa.
- Presents the plan and waits for approval before routing.
- After the provisional system is agreed, points `design_system.locations` at the artifact (`source` stays `none`) and gives `pd-visual-design` and `pd-design-system` its path through `INDEX.md`.
**Must not:**
- Schedules `pd-visual-design` before the provisional system exists, or has visual and design-system each wait on the other.
- Lets `pd-design-system` invent provisional names on its own.
- Presents provisional names as real.
