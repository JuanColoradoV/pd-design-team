# Design-system backlog

<!-- Any specialist appends; pd-design-system-ops triages. Newest at the bottom. -->

## 2026-10-15 — DaySlot (a card for one day of the plan)

- **Flagged by:** pd-design-system in `2026-10-15-components-week-planner.md`
- **Needed:** one component for a day in the week: day heading, either a planned recipe (name, caption, Change/Remove) or an open slot (Add dinner), plus past/read-only and unavailable-recipe variants.
- **Why existing parts didn't fit:** `Card` has no slot anatomy or variants; repeating the composition 7 times on 3 screens invites drift.
- **Substitution used meanwhile:** `Card` + `Button kind=ghost/secondary`, with layout in page CSS (`.day`, `.day-actions` in the mock).
- **Severity:** Medium
- **Blocking:** no
- **Status:** open
- **Decision:** (pending pd-design-system-ops)

## 2026-10-15 — Inline Alert / notice

- **Flagged by:** pd-ux-design in `2026-10-15-design-week-planner.md`, mapped in the components artifact
- **Needed:** non-modal status message (offline, partial list, replace warning, save failed) with icon, text, optional action; status tones.
- **Why existing parts didn't fit:** `EmptyState` is for whole-region emptiness; `Card` has no status tone.
- **Substitution used meanwhile:** `Card` with `--color-surface-accent-subtle` and a bold text lead-in (the mock's `.notice`). Status is carried by text, not color.
- **Severity:** Medium
- **Blocking:** no
- **Status:** open
- **Decision:** (pending)

## 2026-10-15 — TextField (labelled text input)

- **Flagged by:** pd-design-system in `2026-10-15-components-week-planner.md`
- **Needed:** search input in the picker with visible label, focus, error, and disabled states.
- **Why existing parts didn't fit:** no input component exists in `src/components/`.
- **Substitution used meanwhile:** native `<input type="search">` with a visible `<label>`, styled with tokens in page CSS; focus ring comes from the shared `:focus-visible` rule.
- **Severity:** Medium
- **Blocking:** no
- **Status:** open
- **Decision:** (pending)

## 2026-10-15 — Skeleton (loading placeholder)

- **Flagged by:** pd-ux-design in `2026-10-15-design-week-planner.md`
- **Needed:** placeholder blocks for the loading state of day slots and list rows.
- **Why existing parts didn't fit:** no loading primitive exists.
- **Substitution used meanwhile:** `Card` with the visible text "Loading your week" and `aria-busy="true"` on the container. Not built in the mock (loading state is specified only).
- **Severity:** Low
- **Blocking:** no
- **Status:** open
- **Decision:** (pending)
