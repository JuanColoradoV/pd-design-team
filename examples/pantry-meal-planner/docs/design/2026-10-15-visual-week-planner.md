---
project: Pantry meal planner (fictional)
ref: "brief-only: 'Let people plan the week's dinners from recipes they've saved, and get a shopping list for the plan.'"
topic: week-planner
discipline: visual
author: pd-visual-design
date: 2026-10-15
status: in-review
upstream: [2026-10-15-design-week-planner.md, 2026-10-15-content-week-planner.md]
downstream: [components, mocks, qa, handoff]
---

## Summary

Visual treatment through the live tokens in `src/tokens/tokens.css` only (re-read this session). Warm
neutral page, white cards, one accent (terracotta) reserved for the primary action, selected tab, and
checkbox accent. Hierarchy: h1 largest, day names second, recipe names strong body. Contrast was computed
numerically from the token values (Python script, WCAG relative-luminance formula); ratios below.

## Assumptions

- Font is the token stack (`--font-family-sans`); no webfont is loaded in the mock, so it renders in the system fallback. Metrics may shift when a real font ships.
- Hover/pressed colors are checked only where they carry text (primary button).

Learnings applied: none

## Tokens by element

| Element | Type role | Color tokens | Space / radius / other |
|---------|-----------|--------------|------------------------|
| Page | n/a | `--color-surface-page` bg, `--color-text-primary` | page padding `--space-4`, `--space-5` wide; max `--size-content-max` |
| h1 "This week" | `--role-display-default` | `--color-text-primary` | gap below `--space-3` |
| Week range | `--role-body-default` | `--color-text-secondary` | |
| Tabs | `--role-label-default` | selected `--color-text-primary` + accent underline; idle `--color-text-secondary` | height `--size-target-comfortable` |
| Day slot card | n/a | `--color-surface-card`, border `--color-border-subtle` | padding `--space-4`, radius `--radius-lg`, `--shadow-card`, grid gap `--space-4` |
| Day name (h3) | `--role-heading-small` | `--color-text-primary` | |
| Recipe name | `--role-body-strong` | `--color-text-primary` | |
| Caption | `--role-caption-default` | `--color-text-secondary` | |
| Open slot | | `Button kind=ghost`: text `--color-text-accent`, dashed `--color-border-default` | |
| Primary button | `--role-label-default` | `--color-text-on-accent` on `--color-accent-default` | radius `--radius-md` |
| Notice (partial) | `--role-body-default` | text `--color-text-primary` on `--color-surface-accent-subtle`, border `--color-border-default` | padding `--space-4` |
| Checkbox row | `--role-body-default` | `--color-text-primary`; checked `--color-text-secondary` plus strike | row `--size-target-comfortable` |
| Error empty state | | heading `--color-status-error-text` on `--color-status-error-surface` | |
| Focus ring | n/a | `--color-focus-ring` | `--border-width-focus`, offset `--space-1` |

Elevation: cards only (`--shadow-card`); no overlays in v1 (picker is a page panel), so no stacking scale needed.
Meaning without color: checked items are struck through and say so via the native checkbox state; error states carry a heading and text, not only red.

## Contrast results (computed, token value pairs)

| Foreground / background | Ratio | Need | Result |
|-------------------------|-------|------|--------|
| text-primary / surface-page | 14.01 | 4.5 | pass |
| text-primary / surface-card | 14.97 | 4.5 | pass |
| text-secondary / surface-page | 6.95 | 4.5 | pass |
| text-secondary / surface-card | 7.43 | 4.5 | pass |
| text-secondary / surface-sunken | 6.31 | 4.5 | pass |
| text-on-accent / accent-default | 5.55 | 4.5 | pass |
| text-on-accent / accent-hover | 7.41 | 4.5 | pass |
| text-on-accent / accent-pressed | 9.19 | 4.5 | pass |
| text-accent / surface-card | 5.55 | 4.5 | pass |
| text-accent / surface-accent-subtle (ghost hover) | 4.71 | 4.5 | pass (narrow margin) |
| text-primary / surface-accent-subtle | 12.70 | 4.5 | pass |
| status-error-text / status-error-surface | 6.19 | 4.5 | pass |
| border-default / surface-card | 4.20 | 3 | pass (UI boundary) |
| border-default / surface-page | 3.93 | 3 | pass |
| focus-ring / surface-page | 6.71 | 3 | pass |
| focus-ring / surface-card | 7.17 | 3 | pass |

Disabled button (`text-secondary` on `surface-sunken`) is 6.31, legible by team practice.

## Hierarchy check (squint test)

By inspection of the design, not of a render yet: h1, then the primary "View shopping list", then slot cards. The ghost "Add dinner" buttons are dashed and quiet so seven of them do not compete with the one primary.

## Open questions

- Brand: no logo, illustration, or photography exists for Pantry; recipe cards are text-only in v1. Imagery is a product decision.

## Flagged gaps

None new. `--color-text-accent` equals `--color-accent-default` in value; kept as a separate semantic token because text and fill may diverge later (noted for the system owner, not a gap).
