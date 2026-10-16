---
project: Pantry meal planner (fictional)
ref: "brief-only: 'Let people plan the week's dinners from recipes they've saved, and get a shopping list for the plan.'"
topic: week-planner
discipline: mocks
author: pd-mocks
date: 2026-10-15
status: in-review
upstream: [2026-10-15-design-week-planner.md, 2026-10-15-content-week-planner.md, 2026-10-15-visual-week-planner.md, 2026-10-15-components-week-planner.md]
downstream: [qa, handoff, prototype]
---

## Summary

One hi-fi, code-only mock: [`mocks/week-planner.html`](../../mocks/week-planner.html). It links the real
`src/tokens/tokens.css` and `src/components/components.css` and uses their classes and props; page-level layout
is a small `<style>` block that references tokens only. Open the file in any browser (no build step).
Copy is verbatim from the content artifact. Sample data is fictional. The code adapter's audit ran; two
off-token colors were found and fixed before this artifact was written.

## Assumptions

- Fidelity agreed: hi-fi, static (no JavaScript, no interaction). Interactive behavior is not mocked.
- The user accepted building the 4 screens on one page, instead of separate files, for review convenience.
- Rendering and audit used headless Chrome via CLI (not a browser MCP).

Learnings applied: none

## Screens built

| Screen | Section (id) | State shown | Components |
|--------|--------------|-------------|------------|
| Week planner | `#week` | populated (Mon-Fri planned, Sat-Sun open) | Tabs, Card (day slot substitution), Button ghost/secondary/primary |
| Week planner | "empty state" section | empty (first use) | EmptyState, Button primary |
| Add-recipe-to-day picker | "Add dinner for Wednesday" | populated, plus replace case | Button, Card, native search input (substitution), notice (substitution) |
| Shopping list | `#shopping` | partial (2 ingredients unparsed), 3 items checked | Tabs, Checkbox, notice (substitution), Button secondary |

Specified in design but **not built**: loading, error (both screens), offline, no-results, no-saved-recipes,
all-done, deleted-recipe slot. Each is in the design and content artifacts only.

## Batch audit (code adapter, tools/code.md)

| Check | Method | Result |
|-------|--------|--------|
| Raw hex in mock and components.css | `grep -E '#[0-9a-fA-F]{3,8}'` (anchors excluded) | 0 hits |
| Raw px, rgb(), hsl(), font-family in mock and components.css | grep | 0 hits (one comment mentioning "px", reworded) |
| Non-token lengths | grep for rem/em | 1: media query `min-width: 48em` (custom properties cannot be used in media queries; documented exception) |
| Colors resolve to tokens (computed) | Headless Chrome script: for 226 elements, compared computed `color`, `background-color`, border and outline color against resolved `--color-*` token values | First run: 2 off-token (`.skip` link used the browser's default link blue; checkbox inputs used the default black). Fixed (`color` set to a token / `inherit`). Re-run: 0 off-token |
| Components are the system's | Inspection: every button, card, tab, checkbox, empty state uses `.btn`, `.card`, `.tab`, `.checkbox`, `.empty-state` | pass; day slots, notices, search field are logged substitutions |
| Reflow at 320 CSS px | Iframe at 320 px wide: `scrollWidth` 320 = `clientWidth` 320; screenshot viewed | no horizontal scroll, no clipping seen |
| Wide layout (1280) | Screenshot viewed | 5-column week grid, no overlap |
| Touch/target size | Computed bounding boxes of buttons, tabs, inputs, checkbox rows | all at least 24x24; sm buttons are exactly 24 px high; md and rows 44 px |
| Accessible names | Script: buttons and inputs lacking text, label, or aria-label | 0 |

### Contrast, computed from token hex values (WCAG relative luminance)

| Pair used in the mock | Ratio | Threshold |
|-----------------------|-------|-----------|
| text-primary on surface-page / surface-card | 14.01 / 14.97 | 4.5 |
| text-secondary on surface-page / card / sunken | 6.95 / 7.43 / 6.31 | 4.5 |
| text-on-accent on accent-default / hover / pressed | 5.55 / 7.41 / 9.19 | 4.5 |
| text-accent on surface-card (ghost button) | 5.55 | 4.5 |
| text-accent on accent-subtle (ghost hover) | 4.71 | 4.5 |
| text-primary on accent-subtle (notice) | 12.70 | 4.5 |
| status-error-text on status-error-surface (not rendered in mock) | 6.19 | 4.5 |
| border-default on card / page (buttons, search field, ghost dashed) | 4.20 / 3.93 | 3 |
| focus-ring on page / card | 6.71 / 7.17 | 3 |

## Could not check (stated plainly)

- No screen reader run (VoiceOver, NVDA, TalkBack): accessible names and landmarks were checked by script only.
- No automated accessibility scan (axe-core or Lighthouse not installed).
- No live keyboard tab-through in a browser; focus visibility is confirmed from the CSS rule and token contrast, not observed.
- Hover and pressed states not rendered or screenshotted; only their contrast was computed.
- No real-device or touch testing; no 200% text-zoom or text-spacing test; Inter is named in the font stack but no webfont is loaded, so renders used the system fallback.
- Only one browser engine (Chrome headless, macOS).

## Flagged gaps

Same four as the components artifact (DaySlot, Alert, TextField, Skeleton); substitutions used in the mock. No new gaps.
