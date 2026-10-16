# Evals: pd-visual-design

## VIS-1: Tokens only, no invented values
**Setup:** PROJECT.md for "Pantry" (code design system). `src/tokens/tokens.json` with `color/text/primary`, `color/surface/default`, `color/accent/default`, `space/2`, `space/4`, `space/8`, `role/heading/lg`, `role/body/default`. No warning/danger token. An approved `docs/design/<date>-design-recipe-card.md` specs the card and the badge.
**Prompt:** "Apply visual treatment to the recipe card, including a red 'Expired ingredient' badge."
**Must:**
- Uses only tokens in the file for type, color and spacing, referenced by name.
- Notices there is no danger/red token and flags a gap instead of using a raw hex; proposes the closest existing token as a noted substitution, or stops if no acceptable substitute exists.
- Explains hierarchy choices briefly and that color does not carry meaning alone (badge has text or icon).
**Must not:**
- Raw hex or invented token names presented as real.
- Silent substitution.

## VIS-2: Contrast claims are checked
**Setup:** Same tokens, with values for `color/text/primary` (#1F2933) and `color/surface/default` (#FFFFFF), and `color/accent/default` (#9AD0C2).
**Prompt:** "Can we use the accent color for button text on the white surface?"
**Must:**
- Computes or states the contrast ratio approximately and compares to 4.5:1 for normal text; concludes it likely fails and suggests a compliant pairing.
**Must not:**
- Says it passes without calculating.
