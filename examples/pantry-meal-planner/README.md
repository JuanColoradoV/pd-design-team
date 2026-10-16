# Pantry meal planner: a worked example

**Pantry is fictional.** No real company, person, product, or data appears here. This folder is the output
of an AI agent running the pd-* design team end to end on one feature request, following each skill's
own instructions:

> "Let people plan the week's dinners from recipes they've saved, and get a shopping list for the plan."

Treat this folder as a product repo root: design artifacts are in `docs/design/`, the small code design
system in `src/`, and a hi-fi mock in `mocks/`. The research is honest about being desk research and
assumptions only: there were no interviews, so it contains no findings, only labeled assumptions,
hypotheses, and a research plan. The QA artifact has real findings (5 Medium, 4 Low), including things the mock got wrong.

## Reading order

| Step | Skill | Artifact |
|------|-------|----------|
| 0 | pd-design-lead | [PROJECT.md](docs/design/PROJECT.md), [00-plan.md](docs/design/00-plan.md), [INDEX.md](docs/design/INDEX.md) |
| 1 | pd-ux-research | [research](docs/design/2026-10-15-research-week-planner.md) |
| 2 | pd-ux-flows | [flows](docs/design/2026-10-15-flows-week-planner.md) (Mermaid) |
| 3 | pd-ux-design | [design](docs/design/2026-10-15-design-week-planner.md) |
| 4 | pd-ux-writing | [content](docs/design/2026-10-15-content-week-planner.md) |
| 5 | pd-visual-design | [visual](docs/design/2026-10-15-visual-week-planner.md) |
| 6 | pd-design-system | [components](docs/design/2026-10-15-components-week-planner.md), [SYSTEM-BACKLOG](docs/design/design-system/SYSTEM-BACKLOG.md) |
| 7 | pd-mocks (code) | [mocks](docs/design/2026-10-15-mocks-week-planner.md) and the [HTML mock](mocks/week-planner.html) |
| 8 | pd-ux-qa | [qa](docs/design/2026-10-15-qa-week-planner.md) |
| 9 | pd-handoff | [handoff](docs/design/2026-10-15-handoff-week-planner.md) |
| 10 | pd-design-lead (close, retro) | [LEARNINGS.md](docs/design/LEARNINGS.md), INDEX statuses |

The design system the team bound to: [tokens](src/tokens/tokens.css), [components](src/components/README.md).

## Open the mock

Open `mocks/week-planner.html` in a browser (double-click, or `open mocks/week-planner.html`). No build
step. It links `../src/tokens/tokens.css` and `../src/components/components.css`, so keep the folder
structure. It shows four screens on one page; loading, error, and offline states are specified in
the docs but not rendered (QA finding F-1).

## What this example is and is not

It shows the artifact chain, the standard headers, the honesty charter, and a real audit loop (the
mock's audit found and fixed two off-token colors). It is not a statement of WCAG conformance, and
the research it contains has not been run.
