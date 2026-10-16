---
project: Pantry meal planner (fictional)
ref: "brief-only: 'Let people plan the week's dinners from recipes they've saved, and get a shopping list for the plan.'"
topic: week-planner
discipline: components
author: pd-design-system
date: 2026-10-15
status: in-review
upstream: [2026-10-15-design-week-planner.md, 2026-10-15-visual-week-planner.md]
downstream: [mocks, qa, handoff]
---

## Summary

Every design element mapped to a real part of the Pantry code system, re-synced this session by reading
`src/tokens/tokens.css`, `src/components/components.css`, and `src/components/README.md`. Five components
exist and cover most of the work. Four parts are missing and are logged to the backlog (none blocking);
each has a named substitution.

## Assumptions

- The system is the five documented components plus tokens; nothing else is imported.
- Variant combinations were verified against `components.css` selectors, not only against the README.

Learnings applied: none

## Roster re-sync

Components: Button (`data-kind` primary|secondary|ghost; `data-size` sm|md), Card (`data-padding` md|lg),
Checkbox, Tabs (`.tabs`/`.tab`), EmptyState (`data-tone` neutral|error). Deprecated: none. Tokens: as in
the visual artifact; all names below were found in `tokens.css`.

## Mapping

| Design element | Component · variant | Type style | Tokens | States needed | Status |
|---|---|---|---|---|---|
| Prev/next week | `Button kind=secondary, size=md` | `--role-label-default` | `--color-surface-card`, `--color-border-default` | default, hover, focus, disabled | OK |
| Plan / Shopping list tabs | `Tabs` + `.tab[aria-selected]` | `--role-label-default` | `--color-accent-default` underline | default, selected, hover, focus | OK |
| Day slot | `Card data-padding=md` + page CSS | `--role-heading-small` | `--color-surface-card`, `--shadow-card`, `--radius-lg` | populated, open, past, unavailable recipe | substituted (DaySlot gap) |
| Add dinner | `Button kind=ghost, size=md` | `--role-label-default` | `--color-text-accent`, `--color-border-default` | default, hover, focus, disabled (past) | OK |
| Change / Remove | `Button kind=secondary, size=sm` | `--role-label-default` | as above | default, hover, focus, loading (`aria-busy`) | OK |
| View shopping list | `Button kind=primary, size=md` | `--role-label-default` | `--color-accent-default/-hover/-pressed`, `--color-text-on-accent` | default, hover, pressed, focus | OK |
| Browse saved recipes (empty) | `Button kind=primary, size=md` inside `EmptyState` | `--role-label-default` | as above | default, focus | OK |
| Empty / error screens | `EmptyState data-tone=neutral|error` | `--role-heading-default`, `--role-body-default` | `--color-status-error-*` for error | neutral, error | OK |
| Picker search | native `input[type=search]` + label | `--role-body-default` | `--color-border-default`, `--radius-md` | default, focus, filled, disabled | substituted (TextField gap) |
| Recipe row | `Card` + `Button kind=secondary, size=md` | `--role-body-strong`, `--role-caption-default` | card tokens | default, focus | OK |
| Replace / Keep current | `Button kind=primary` / `kind=secondary`, size md | `--role-label-default` | | default, focus, loading | OK |
| Notices (offline, partial, replace) | `Card` + page `.notice` | `--role-body-default` | `--color-surface-accent-subtle`, `--color-border-default` | n/a | substituted (Alert gap) |
| Loading placeholders | `Card` + text "Loading" | `--role-body-default` | card tokens | n/a | substituted (Skeleton gap); specified only |
| Shopping rows | `Checkbox` | `--role-body-default`, `--role-caption-default` | `--color-accent-default` (native accent), `--size-target-comfortable` | unchecked, checked, focus | OK |
| Clear checked items | `Button kind=secondary, size=md` | `--role-label-default` | | default, disabled (none checked), focus | OK |

## Verification

- Each `kind`/`size` pair used (`ghost+md`, `secondary+sm`, `secondary+md`, `primary+md`) has a rule in `components.css`: the base `.btn` rule covers size sm by default and `[data-size="md"]` adds the 44px height. `ghost+sm` is not used.
- Not covered by the system: a `Button` loading visual (only `aria-busy` and `cursor`; no spinner). Treated as acceptable for v1; noted for ops.

## Open questions

- Should `Card` gain an interactive variant (whole card as target)? Not needed here; picker rows keep an explicit button.

## Flagged gaps

DaySlot (Medium), inline Alert (Medium), TextField (Medium), Skeleton (Low). All in `design-system/SYSTEM-BACKLOG.md`, all non-blocking, substitutions as in the table.
