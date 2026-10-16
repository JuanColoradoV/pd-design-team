# Compliance pillars

Two pillars apply to all work. Regulatory pillars apply only when `PROJECT.md` (the `compliance` field)
or a loaded domain pack activates them. Nothing is done until findings against active pillars are
resolved or explicitly accepted by the user. `pd-ux-qa` runs the audits and states which pillars it
ran and which it skipped.

## Universal pillars

### 1. Accessibility

The level comes from `PROJECT.md` (default WCAG 2.2 AA). Checklist and thresholds are in
`accessibility.md`. `pd-ux-qa` combines automated and manual checks, and failures at the target level
are defects.

> **Recency caveat.** WCAG 2.2 is the current recommendation as of this writing; WCAG 3.0 work is
> ongoing. Verify which version and level the project is contractually held to.

### 2. Usability heuristics

Evaluate every screen and flow against Nielsen Norman Group's 10 usability heuristics (Jakob Nielsen,
with Rolf Molich; first proposed 1990, refined to the current set in 1994):

1. Visibility of system status
2. Match between the system and the real world
3. User control and freedom
4. Consistency and standards
5. Error prevention
6. Recognition rather than recall
7. Flexibility and efficiency of use
8. Aesthetic and minimalist design
9. Help users recognize, diagnose, and recover from errors
10. Help and documentation

> **Method caveat.** Heuristic evaluation is expert inspection, not empirical validation. It surfaces a
> subset of real problems and can produce false positives. Treat it as a fast first pass and pair it
> with `pd-ux-research` usability testing for anything high-stakes or high-traffic.

## Regulatory pillars (activated by the project)

Examples: HIPAA (US health data), GDPR and similar privacy regimes (EU/UK and others), PCI DSS
(payment cards), COPPA (children's data), sector rules for finance or education. The design dimension
of each is the UI practice that supports it: minimum necessary disclosure, consent flows, data
masking, no sensitive data in URLs or logs, session handling, auditability.

- A domain pack in `domains/` holds the UI rules for its regime (for example `domains/healthcare.md`
  covers HIPAA-aware UI and notes other regimes).
- If a regime applies but no pack exists, say so, apply general data-minimization practice, and
  suggest writing one from `domains/_template.md`.
- Verify the jurisdiction. HIPAA is US law; other regions have different rules (GDPR treats health data
  as special-category data, for instance).

> **Honesty caveat.** Design supports regulatory compliance; it does not certify it. Compliance is
> organizational and technical, not just UI. Say a design "follows HIPAA-aware UI practices" (or the
> equivalent), never that it "is HIPAA compliant," and recommend formal security, legal, and
> compliance review. This is not legal advice.

## Shared severity scale

Use this wherever a finding is logged: QA, batch audits, backlog.

| Severity | Definition | Ship gate |
|----------|-----------|-----------|
| **Critical** | Blocks core task completion, violates a legal or compliance requirement (an active regulatory pillar, the accessibility target), or risks data loss or harm. | Fix before ship. |
| **High** | Significantly degrades usability or accessibility on a common path or persona. | Fix, or get explicit user sign-off to ship with it open. |
| **Medium** | Noticeable friction or inconsistency; a workaround exists. | Fix this cycle or file a tracked follow-up. |
| **Low** | Cosmetic or edge case only. | Backlog; no gate. |

## Where each is enforced

- Built in by every discipline as a constraint while working.
- Gated by `pd-ux-qa`: accessibility, usability heuristics, plus any active regulatory audit.
- Reported with severity, then resolved or explicitly accepted before "done."

## Honest compliance claims

State the level tested, the method, and the scope actually audited.
- Good: "No failures found in the checks performed on the 6 audited screens. Methods: automated scan,
  manual keyboard pass, contrast check. Assistive tech: VoiceOver only. Not tested: [criteria not
  covered, such as captions or time limits]."
- Reserve "conforms to WCAG 2.2 AA" for a complete, evidenced evaluation of every applicable success
  criterion across the stated scope of complete pages or processes.
- Not acceptable: "Fully accessible." "HIPAA compliant."

Flag uncertainty, and recommend formal review where a claim goes beyond what design can verify. Cite
usability statistics only if real (see `working-agreement.md`).
