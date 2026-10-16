---
project: Pantry meal planner (fictional)
ref: "brief-only: 'Let people plan the week's dinners from recipes they've saved, and get a shopping list for the plan.'"
topic: week-planner
discipline: plan
author: pd-design-lead
date: 2026-10-15
status: approved
upstream: []
downstream: [research, flows, design, content, visual, components, mocks, qa, handoff]
---

## Summary

Approved by the user on 2026-10-15. Unit of work: one new feature (weekly dinner planner plus a derived
shopping list) for web and mobile web. Smallest sensible pipeline for a new feature in a code-only project
with a working design system and no analytics. Pantry is a fictional product.

## Assumptions

- Brief-only: no tracker item, so `ref:` quotes the brief and no acceptance criteria are invented. QA tests against the criteria listed below, which the lead derived from the brief and the user confirmed.
- "Saved recipes" already exist in the product (a saved-recipes list). This effort does not redesign saving.
- Dinners only (not breakfast/lunch), one recipe per day (open question for research).

Learnings applied: none (LEARNINGS.md does not exist yet).

## Session check (recorded in PROJECT.md `capabilities`)

Shell, file write, run-code, vision, headless Chrome CLI for screenshots. Missing: design-tool MCP (not needed,
`design_tool: code-only`), web search (not used), screen reader, axe-core, analytics, parallel subagents.

## Acceptance criteria (derived from the brief, confirmed by the user)

1. A user can put a saved recipe on a day of the current week and remove or change it.
2. A shopping list exists for the plan and updates when the plan changes.
3. Every screen specifies empty, loading, error, partial, and populated states.
4. WCAG 2.2 AA, keyboard-operable, usable at 320 CSS px width.

## Pipeline

| # | Skill | Artifact | Why |
|---|-------|----------|-----|
| 1 | pd-ux-research | `*-research-week-planner.md` | Problem is not evidenced; no real research possible here, so assumptions plus a research plan |
| 2 | pd-ux-flows | `*-flows-week-planner.md` | Multi-step, branches on empty and failure |
| 3 | pd-ux-design | `*-design-week-planner.md` | Three screens, every state |
| 4 | pd-ux-writing, then pd-visual-design | `*-content-*`, `*-visual-*` | Independent; run in sequence (no parallel subagents) |
| 5 | pd-design-system | `*-components-*` | Map to real parts, log gaps |
| 6 | pd-mocks (code) | `mocks/week-planner.html`, `*-mocks-*` | Hi-fi join point, with code-adapter audit |
| 7 | pd-ux-qa | `*-qa-*` | Quality gate |
| 8 | pd-handoff | `*-handoff-*` | Engineering spec |
| 9 | Lead close and retro | `INDEX.md`, `LEARNINGS.md` | |

Skipped, with reasons: `pd-ux-architecture` (the nav addition is one tab, no new content model; covered in flows),
`pd-responsive` (mobile-web layout is specified inside design and checked in QA), `pd-prototyping` (no motion
beyond a 120 ms color transition), `pd-metrics` (no analytics source), `pd-design-system-ops` (side loop; gaps are logged,
triage is a follow-up, not part of this effort).

## Checks this session cannot perform

Real user research; screen-reader testing; automated axe/Lighthouse scan; real-device touch testing.
Each will be listed as untested wherever a claim depends on it.
