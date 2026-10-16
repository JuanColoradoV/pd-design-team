---
project: Pantry meal planner (fictional)
ref: "brief-only: 'Let people plan the week's dinners from recipes they've saved, and get a shopping list for the plan.'"
topic: week-planner
discipline: qa
author: pd-ux-qa
date: 2026-10-15
status: in-review
upstream: [2026-10-15-design-week-planner.md, 2026-10-15-content-week-planner.md, 2026-10-15-visual-week-planner.md, 2026-10-15-components-week-planner.md, 2026-10-15-mocks-week-planner.md, 2026-10-15-flows-week-planner.md, 2026-10-15-research-week-planner.md]
downstream: [handoff, design]
---

## Summary

QA of `mocks/week-planner.html` against the design, content, visual and component artifacts, the plan's
acceptance criteria, NN/g heuristics, and WCAG 2.2 AA (profile target). 9 findings: 0 Critical, 0 High,
5 Medium, 4 Low. No failures of the checked WCAG criteria were found, but the evidence is limited (no
screen reader, no automated scanner, no live keyboard pass). Inputs missing: none; research is assumptions only.

## Assumptions

- Regulatory pillars: none active (`regulatory: []`), not run. Domain packs: none.
- Heuristic findings are predicted problems from inspection, not user-test results.
- Tasks walked: (T1) plan Wednesday's dinner on a week with Wednesday already filled; (T2) shop from the list and understand an unreadable ingredient; (T3) start from an empty week and add a first dinner; (T4) change the plan after shopping began.

Learnings applied: none

## Findings

| ID | Area/Screen | Pillar | Severity | Detail | Recommendation | Status |
|----|-------------|--------|----------|--------|----------------|--------|
| F-1 | Mock coverage, all screens | Design-vs-spec (criterion 3) | Medium | Loading, error, offline, no-results, no-saved-recipes, all-done and deleted-recipe states are specified but not rendered, so they could not be audited. | Render them in the mock or a state gallery before build; QA re-tests them. | open |
| F-2 | Picker | Design-vs-spec | Medium | Third row shows "Replace" (primary) next to "Keep current" without a prior "Choose", contradicting the design's two-step replace flow and mixing primary and secondary actions across rows. | Show Replace/Keep current only after Choose, on the chosen row; re-test T1. | open |
| F-3 | Tabs, screens 1 and 3 | Accessibility (4.1.2 pattern, 2.1.1) | Medium | Tabs lack arrow-key and roving-tabindex behavior; both tabs are in the tab order; `aria-controls` targets are whole page sections, no `role="tabpanel"`. Buttons are focusable and operable, so no WCAG failure was identified, but the ARIA pattern is incomplete. | Implement the ARIA tabs pattern or use link-style navigation (`nav` with `aria-current`) since Plan and Shopping list are separate routes. | open |
| F-4 | Shopping list | Heuristic 1 (visibility) | Medium | Checked rows strike through the whole text, including "Amount changed" in the caption, so the warning vanishes exactly when the user has already checked the item (flow 3, T4). | Move "Amount changed" outside the struck-through span and keep it visible; add text cue, not only strike. | open |
| F-5 | Shopping list partial notice | Heuristic 9 (recover from errors) | Medium | "Check them in the recipe" has no link to the recipe and the list has no way to add an item by hand: T2 ends at a dead end. | Link each recipe name; add the manual-item decision to the next design cycle (open question). | open |
| F-6 | Week planner | Accessibility (2.5.8 passes, best practice) | Low | "Change" and "Remove" are 24x24 px minimum (meets 2.5.8), well below the 44 px touch target the system uses elsewhere, for the most frequent per-day actions on mobile. | Use `size=md` on narrow screens or add padding; qualifies under Fitts's law, not a WCAG failure. | open |
| F-7 | Week planner, wide | Heuristic 4 (consistency) | Low | At 1280 px the grid wraps 5+2, at other widths differently, so the weekend is not visually grouped and the week reads as a block of cards without a stable row. | Fix 7 columns above a width, or 4+3 deliberately; or add week-row grouping. | open |
| F-8 | Tokens | Rendered-output | Low | `--font-family-sans` names Inter but no font is loaded, so the mock renders in the system font and metrics (wrapping) may change when a webfont ships. | Load the font or remove it from the stack; re-check wrapping. | open |
| F-9 | Mock page | Accessibility (2.4.6, best practice) | Low | The mock page has four `h2` sections and repeats "This week" as the heading for two screens; ids referenced by `aria-controls` exist only because screens share a page. | Not a product issue; do not carry the mock's page structure into the build (handoff note). | open |

## Audits performed

1. **Heuristics:** T1-T4 walked against flows and mock by inspection; findings F-2, F-4, F-5, F-7.
2. **Accessibility:** contrast on the token pairings used (ratios in the mocks artifact; all meet 4.5 for text, 3 for boundaries); target sizes by computed boxes (all at least 24 px, so 2.5.8 met in the checks performed); reflow at 320 CSS px (no horizontal overflow, 1.4.10 checked at that width only); accessible names by script (0 unnamed); focus-visible rule present with 6.71 and 7.17 contrast against its backgrounds (by inspection, not observed). 2.4.11 not at risk: no sticky elements. 2.5.7: no dragging in the design.
3. **Regulatory:** not run, none active.
4. **Design-vs-spec:** copy matches the content artifact for the rendered strings; tokens and components per the components artifact; criteria 1 (add/remove a recipe) and 2 (list updates) are interaction behaviors and cannot be verified on a static mock; criterion 3 fails for the unrendered states (F-1); criterion 4 see accessibility.
5. **Rendered output:** screenshots at 1280 and 320 viewed; no clipping or overflow seen; the computed-color check found 0 off-token colors after the fix recorded in the mocks artifact.

## Compliance summary

No failures were found in the checks performed on the 4 mock sections (contrast computed from tokens, computed target
sizes, 320 px reflow, accessible-name script, token-binding script). Screen reader not tested; automated scanner not run; keyboard tab-through
not performed in a browser; hover/pressed states and 200% zoom/text spacing not tested. Criteria not tested at all: captions, time limits,
3.3.x form validation (no live forms), 2.2.x, 1.4.12. This is not a statement of WCAG 2.2 AA conformance.

## Sign-off

**Pass with conditions.** No Critical or High findings. Medium findings F-1 to F-5 must be fixed this cycle or filed as tracked follow-ups
(shown in the handoff open questions); after fixes, the whole accessibility and design-vs-spec pillars should be re-run. The user has not yet
accepted any finding as won't-fix.

## Open questions

- Who runs the screen-reader pass (VoiceOver on iOS Safari is the most likely primary pairing, an assumption)?

## Flagged gaps

None new; F-3 may justify a Tabs fix in the system (to `pd-design-system-ops`).
