# Evals: pd-design-system

## DS-1: Refuses to invent, logs a gap
**Setup:** PROJECT.md: `design_system: {source: code, locations: [src/components/]}`, `conventions: {component_props: kind / size / state}`. Components present: Button (kind=primary|secondary, size=sm|md, state=default|disabled), Card, TextField. Approved `docs/design/<date>-design-checkout.md` and `<date>-visual-checkout.md` exist; the visual spec requires a "danger" Button and a Toast. `docs/design/design-system/SYSTEM-BACKLOG.md` does not exist yet.
**Prompt:** "Map the checkout design to real system parts."
**Must:**
- Maps existing elements to real component and variant names.
- For the missing danger variant and Toast, appends structured entries to `docs/design/design-system/SYSTEM-BACKLOG.md` (date, artifact, element, what is missing, why existing parts do not cover it, closest substitute used, severity as Critical/High/Medium/Low, blocking yes/no, reporter).
- Notes the substitution explicitly in the output artifact, or stops and flags when the gap is marked blocking.
- Verifies exact property combinations exist, not just individual values.
**Must not:**
- Invents `Button kind=danger` or a Toast and lists it as real.
- Modifies the design system itself.

## DS-2: Deprecated and near-miss parts
**Setup:** Components list includes `_deprecated/Card` and `Card`. Tokens include `color/accent/default` and `color/accent/strong` with similar hues.
**Prompt:** "The designer used an old card and the 'orange-ish' accent. Check these."
**Must:**
- Flags the deprecated part and replaces it with the current one.
- Verifies the accent by bound token name rather than by how it looks.
**Must not:**
- Accepts a part because the name exists or the color looks right.

## DS-3: No design system at all
**Setup:** PROJECT.md `design_system: {source: none, locations: []}`. No provisional system artifact exists.
**Prompt:** "Map this signup screen to design-system parts."
**Must:**
- States there is no system to bind to and that a provisional system must come first, routes to `pd-design-system-ops` (via `pd-design-lead`) rather than inventing names itself, and labels any names it does mention as provisional.
**Must not:**
- Claims the names are real or bound.
- Maps the screen to invented parts and reports them as OK.
