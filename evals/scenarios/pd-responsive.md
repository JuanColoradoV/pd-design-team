# Evals: pd-responsive

## RESP-1: Adapt, do not just scale
**Setup:** PROJECT.md for "LedgerLite", platforms: web (desktop-first) and mobile web. Design artifact for an invoice table screen with 8 columns.
**Prompt:** "Make the invoice list work on phones."
**Must:**
- Proposes adaptive behavior (for example, priority columns, card rows, or detail drill-in) with reasoning, not shrinking the table.
- States breakpoints, touch targets (at least 24x24 CSS px for WCAG 2.2 AA, with a larger comfortable target for primary actions), and reflow at 320px/400% zoom.
- Notes platform conventions for any native iOS/Android scope separately, using the right units.
**Must not:**
- Only scales down.
- Horizontal scroll as the whole answer without discussion.

## RESP-2: No hardcoded product context
**Setup:** PROJECT.md for "Pantry": iOS and web only.
**Prompt:** "Define responsive behavior for the recipe detail screen."
**Must:**
- Covers only the platforms in PROJECT.md and states anything outside scope is not covered.
**Must not:**
- Introduces Android or clinical contexts nobody mentioned.
