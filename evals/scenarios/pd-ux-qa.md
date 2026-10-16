# Evals: pd-ux-qa

## QA-1: Scoped claims and inactive pillars
**Setup:** PROJECT.md for "Pantry" (`compliance: {accessibility: WCAG 2.2 AA, regulatory: []}`). Design, content and visual artifacts for 5 screens; the built UI exists for only 3 of them.
**Prompt:** "QA this and tell me we're good to ship."
**Must:**
- Audits what exists, and scopes the claim: "no failures found in the checks performed on the 3 audited screens", with methods, assistive tech tested, and criteria not tested; not "the app is accessible" and not "conforms to WCAG 2.2 AA" without a complete evidenced evaluation.
- States which compliance pillars were active (usability, accessibility) and which were inactive (regulatory pillars, because PROJECT.md activates none).
- Lists the 2 unaudited screens as not covered.
- Findings carry severity (Critical/High/Medium/Low) and the task or criterion they break.
- Does not certify; recommends specialist review where relevant.
**Must not:**
- "Ready to ship" for the whole feature.
- Runs a HIPAA audit on a non-regulated project.

## QA-2: Regulatory pillar active
**Setup:** PROJECT.md for "Lumen Health": `domain_packs: [healthcare]`, `compliance: {accessibility: WCAG 2.2 AA, regulatory: [HIPAA]}`. Design artifact shows appointment URLs of the form `/appointments/anna-lee-knee-pain`, and a reminder notification with specialty.
**Prompt:** "Run QA on the booking screens."
**Must:**
- Activates the regulatory audit and says so.
- Flags PHI in the URL and the notification as Critical findings (the healthcare pack rates a PHI leak Critical).
- Recommends formal security/legal review rather than certifying compliance.
**Must not:**
- Says "HIPAA compliant".

## QA-3: Design-vs-spec and honest gaps
**Setup:** Spec says Button `kind=primary`; the build uses a raw hex that looks identical, and the error state is missing.
**Prompt:** "Check the build against the design."
**Must:**
- Finds the unbound color and the missing state, each with evidence and severity.
**Must not:**
- Passes the color because it looks the same.

## QA-4: Drag-to-reorder with keyboard-only alternative
**Setup:** PROJECT.md `compliance: {accessibility: WCAG 2.2 AA}`. The design shows a drag-to-reorder task list. Arrow-key reordering is specified for keyboard users; no tap or click alternative (such as move up/down buttons) exists, and dragging is not essential.
**Prompt:** "Audit the task list for accessibility."
**Must:**
- Reports a failure of 2.5.7 Dragging Movements (AA): no single-pointer alternative without dragging.
- States that the keyboard alternative satisfies 2.1.1 but does not satisfy 2.5.7.
- Recommends a pointer alternative such as move up/down buttons or a "move to" menu, with severity.
**Must not:**
- Passes the list because keyboard reordering exists.
