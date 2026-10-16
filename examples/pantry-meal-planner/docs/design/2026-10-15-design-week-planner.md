---
project: Pantry meal planner (fictional)
ref: "brief-only: 'Let people plan the week's dinners from recipes they've saved, and get a shopping list for the plan.'"
topic: week-planner
discipline: design
author: pd-ux-design
date: 2026-10-15
status: in-review
upstream: [2026-10-15-flows-week-planner.md, 2026-10-15-research-week-planner.md]
downstream: [content, visual, components, responsive, mocks, qa, handoff]
---

## Summary

Three screens: Week planner (home of the feature, a "Plan" tab), Add-recipe-to-day picker (a page-level
panel, not a modal), and Shopping list (second tab). One primary action per screen. Wire-to-mid fidelity;
tokens and copy come from the visual and content artifacts. Components are the real Pantry system
(`src/components/README.md`); four needed parts do not exist and are flagged (see Flagged gaps).

## Assumptions

- Research is assumptions-only; layout choices follow A-1..A-7 and are marked. Flows are the upstream truth.
- Breakpoint: one layout switch at 48em (single column below, week grid above). Responsive artifact skipped; checked in QA.
- Week starts Monday (flows Q3). Current week only in v1 plus prev/next arrows.

Learnings applied: none

## Screen 1: Week planner

**Purpose:** see the week, fill or change a day, reach the shopping list. **Primary action:** "View shopping list" (`Button kind=primary, size=md`); day-level "Add dinner" is a ghost button so the page keeps one primary.

**Layout (wide):** page header (h1, week range, prev/next week `Button kind=secondary, size=md`), `Tabs` (Plan | Shopping list), then an ordered list of 7 day slots in an auto-fit grid (min `--size-day-min`), then the primary action. **Narrow:** same order, one column, day slots stacked. The primary action stays at the end of the page, not sticky, to avoid covering focused elements (WCAG 2.4.11 risk).

**Day slot (gap, built from Card):** `Card` containing day name (h3), then either a recipe (name, caption "4 servings · 35 min") with `Button kind=secondary, size=sm` "Change" and "Remove", or an open slot with `Button kind=ghost, size=md` "Add dinner".

| State | What shows |
|-------|------------|
| Loading | 7 skeleton day slots (gap: Skeleton; substitution: Card with static placeholder text "Loading"); `aria-busy="true"` on the list |
| Empty | `EmptyState` "No dinners planned yet" with `Button kind=primary` "Browse saved recipes"; open day slots hidden |
| Error | `EmptyState data-tone=error` "Couldn't load your plan" + `Button` "Try again"; last cached plan is shown beneath if it exists |
| Partial | Some days planned, others open (the normal case); plus a slot whose recipe was deleted: "Recipe no longer available" with "Choose another" |
| Populated | Mon-Fri filled, Sat-Sun open, as in the mock |
| Saving (combination) | "Remove" is `aria-busy="true"` and non-activatable while saving; entered picker search is preserved on error |
| Offline | Notice (gap: Alert) "You're offline. Changes are saved on this device." Plan stays editable |

**Interactions:** "Add dinner" or "Change" opens Screen 2 for that day. "Remove" removes at once and shows an Undo notice for the rest of the session (no confirm dialog; reversible). Focus: after removing, focus moves to that day's "Add dinner" button; after returning from the picker, focus lands on the changed day's "Change" button. Past days of the current week are read-only (disabled buttons, text says "Past").
**Annotations:** list is `<ol>`; each slot labelled by its h3; buttons say "Remove Monday's dinner" via `aria-label` only where the visible label is shorter than the context needs (visible text "Remove" is contained in the name). Targets: sm buttons 24px min height with spacing, md 44px. Tab order: header buttons, tabs, slots in day order (Change, Remove per slot), primary action.

## Screen 2: Add-recipe-to-day picker

**Purpose:** choose one saved recipe for a chosen day. **Primary action:** none on the list itself; each recipe row has "Choose" as `Button kind=secondary, size=md` so a long list does not repeat a primary. The one primary on this screen appears only in the replace confirmation ("Replace").

**Layout:** header "Add dinner for Wednesday" with "Back to week" (`kind=secondary`), a search field (gap: TextField), a list of recipe `Card`s (name, caption "4 servings · 35 min", "Choose"). Same layout wide/narrow (single column list capped at `--size-measure`).

| State | What shows |
|-------|------------|
| Loading | Skeleton rows (gap); the search field stays enabled |
| Empty (no saved recipes) | `EmptyState` "No saved recipes yet" + `Button kind=primary` "Find recipes" |
| No results | `EmptyState` "Nothing matches 'xyz'" + "Clear search" |
| Error | `EmptyState data-tone=error` "Couldn't load your recipes" + "Try again"; search text kept |
| Populated | Recipe cards; recipes already in this week show caption "Also on Monday" (a visible text cue) |
| Partial (replace) | Day already has a dinner: banner (gap: Alert) "Wednesday already has Mushroom stroganoff. Choosing a new recipe replaces it." Choosing then shows `Button kind=primary` "Replace" and `kind=secondary` "Keep current" inline |
| Saving failed | Notice "Couldn't save. Your choice is kept." + Try again; list scroll position preserved |

**Interactions and focus:** opening moves focus to the h1; Escape or "Back to week" returns focus to the invoking day button; choosing returns to Screen 1 with focus on the changed day. Search is live-filtered with the result count announced in a polite live region.

## Screen 3: Shopping list

**Purpose:** a trusted, store-ready list for the plan. **Primary action:** none that mutates; the screen is for checking items off (checkbox is the main interaction). Secondary: "Clear checked items" (`kind=secondary, size=md`).

**Layout:** `Tabs` (Shopping list selected), summary line "14 items for 5 dinners", partial notice if any, then groups by store section (Produce, Dairy and eggs, Pantry, Meat and fish), each an h2 plus a list of `Checkbox` rows: item name + amount, caption "For Mon, Thu". Narrow: identical, single column.

| State | What shows |
|-------|------------|
| Loading | Skeleton rows (gap) |
| Empty | `EmptyState` "Nothing to shop for yet" + `Button kind=primary` "Plan dinners" |
| Error | `EmptyState data-tone=error` "Couldn't build your list" + "Try again"; cached list kept when available |
| Partial | Notice (gap: Alert): "2 ingredients couldn't be added" with the lines listed by recipe |
| Populated | Groups with checkboxes; checked rows dim and strike (not color alone) |
| All done | Summary "All 14 items checked" (text), "Clear checked items" |
| Offline | Notice "You're offline. Checks are saved on this device." |
| Plan changed | Item shows "Amount changed" caption (flows Flow 3); checked state kept |

**Annotations:** each group is a `<section>` with an `aria-labelledby` h2; checking announces nothing extra (native checkbox state). Counts update a polite live region. Target size: whole row 44px. Undo for "Clear checked items".

## Open questions

- Staples: show items like salt or oil? (A-5) Design currently lists everything; a "Hide staples" toggle is a possible v2.
- Multi-recipe days (A-2) would turn a slot into a list; the slot would change from one recipe to many.

## Flagged gaps

Logged in `design-system/SYSTEM-BACKLOG.md`: DaySlot (substituted by Card + Buttons), inline Alert (Card with status tokens), TextField (native input styled with tokens), Skeleton (static placeholder card). None blocking.
