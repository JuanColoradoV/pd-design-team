---
project: Pantry meal planner (fictional)
ref: "brief-only: 'Let people plan the week's dinners from recipes they've saved, and get a shopping list for the plan.'"
topic: week-planner
discipline: handoff
author: pd-handoff
date: 2026-10-15
status: draft
upstream: [2026-10-15-design-week-planner.md, 2026-10-15-content-week-planner.md, 2026-10-15-visual-week-planner.md, 2026-10-15-components-week-planner.md, 2026-10-15-mocks-week-planner.md, 2026-10-15-qa-week-planner.md]
downstream: [engineering]
---

## Summary

**Spec version 1.0.** Engineering spec for the Pantry weekly planner and shopping list (fictional product). Because the
design system is code, the tokens and components named here are the implementation: use them directly,
no translation layer. QA passed with conditions (5 Medium findings open); the spec carries them as build notes.
Reference build: `mocks/week-planner.html`. Requirement: the brief (no tracker item, so nothing to link back to).

## Assumptions

- Web and mobile web, one codebase, one breakpoint: single column below `48em` (768 px at default font size), auto-fit grid at and above (min column `--size-day-min` = 11rem). Supported viewport range 320 px and up. No `pd-responsive` artifact; this is the stated scope.
- Units: rem for space, size and type; 1px/3px borders via `--border-width-*`.
- Data model, API and offline sync are engineering decisions; this spec states only what the UI needs.

Learnings applied: none

## Token mapping (design name = code name)

| Purpose | Token (verified in `src/tokens/tokens.css`) |
|---------|-------------------------------|
| Page / card / sunken / notice surface | `--color-surface-page`, `--color-surface-card`, `--color-surface-sunken`, `--color-surface-accent-subtle` |
| Text | `--color-text-primary`, `--color-text-secondary`, `--color-text-on-accent`, `--color-text-accent` |
| Accent / states | `--color-accent-default`, `-hover`, `-pressed`; focus `--color-focus-ring` (`--border-width-focus`, offset `--space-1`) |
| Borders | `--color-border-default` (controls), `--color-border-subtle` (cards) |
| Status | `--color-status-error-text`, `--color-status-error-surface` (also `-success-*`, unused in v1) |
| Type roles | `--role-display-default`, `--role-heading-default`, `--role-heading-small`, `--role-body-default`, `--role-body-strong`, `--role-label-default`, `--role-caption-default` (apply with `font: var(--role-…)`) |
| Space / radius / size | `--space-1..8`, `--radius-sm|md|lg`, `--size-target-min` (24 px), `--size-target-comfortable` (44 px), `--size-content-max`, `--size-day-min`, `--size-measure`, `--shadow-card`, `--motion-fast` |

## Component mapping

| Design | Code (`src/components/components.css`) | Variants covered |
|--------|------------------------------|------------------|
| Button | `.btn[data-kind][data-size]` | primary/secondary/ghost, sm/md; hover, pressed, focus, disabled, loading via `aria-busy`. Mapping covers every variant the spec uses; `ghost+sm` is unused |
| Card | `.card[data-padding]` | md, lg |
| Checkbox | `.checkbox` + native input | unchecked, checked, focus |
| Tabs | `.tabs` / `.tab[aria-selected]` | selected, idle. See QA F-3 for behavior |
| EmptyState | `.empty-state[data-tone]` | neutral, error |
| DaySlot, Alert, TextField, Skeleton | **not in code**: build as page-level CSS first, per the backlog entries | pending triage; `SYSTEM-BACKLOG.md` |

## Per-screen spec

Layout, hierarchy, copy and states are in the design and content artifacts; the mock is the visual reference. Build notes:

- **Week planner:** `<ol>` of 7 slots, each a `Card` labelled by its `h3`; "Change"/"Remove" have `aria-label` with the day; "Remove" is optimistic with a 1-line Undo notice; focus moves to the day's "Add dinner" after removal and to the changed day's "Change" after returning from the picker. Primary "View shopping list" is not sticky (Focus Not Obscured).
- **Picker:** a routed page panel, not a modal; focus to the `h1` on open; Escape/Back returns focus to the invoking button. Search is live-filtered, with the count in a polite `role=status`. Keep search text and scroll position through errors and retries. Replace requires an explicit second step (fixes QA F-2).
- **Shopping list:** groups as `<section aria-labelledby>`; checked state persists on device; "Clear checked items" is undoable, no confirm dialog. Keep "Amount changed" outside the struck-through text (QA F-4). Link recipe names in the partial notice (QA F-5).
- **States to build (not in the mock):** loading (`aria-busy`, text "Loading your week"), error (`EmptyState data-tone=error`), offline notice, no saved recipes, no results, all done, deleted recipe. Strings in the content artifact.
- **Stacking:** no overlays in v1; the only layered element is the skip link (z-order above content on focus).

## Accessibility

Focus order follows DOM order (header buttons, tabs, slots in day order, primary action). Shared `:focus-visible` ring, 3 px, never removed. Targets: md and rows 44 px, sm 24 px minimum (consider md on narrow, QA F-6). Respect `prefers-reduced-motion` (already via `--motion-fast`). Screen-reader pass still owed (not run in QA).

## Assets

None: no icons, images or fonts. Decide on the Inter webfont (QA F-8).

## Compliance acceptance status

No failures found in the checks QA performed (see QA artifact for scope and untested criteria). Not a conformance claim.

## Open questions

- Engineering: structured ingredient data? offline writes and sync (the offline strings assume it)?
- Product: multiple recipes per day, hide-staples toggle, manual list items, week start day.
- QA: Medium findings F-1 to F-5 are to be fixed this cycle or tracked; need the user's call.
