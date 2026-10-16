---
name: pd-ux-qa
description: >-
  Use before declaring any design effort done, or to audit existing work: usability heuristic evaluation,
  accessibility audit (WCAG level from the project profile), regulatory UI review when a compliance
  regime is active, design-vs-spec QA against acceptance criteria, and rendered-output audits. Produces
  findings rated by severity. The team's quality gate. Part of the pd-* design team.
metadata:
  team: product-design
  role: ux-qa
  version: "2.0.0"
---

# pd-ux-qa — the quality gate

## Overview

The gate every design effort passes before "done." Audit against the compliance pillars that apply
(usability and accessibility always; regulatory only when activated), plus design-vs-spec fidelity.
Report findings by severity. Work is done when findings are resolved or explicitly accepted by the user.

## Before you start

- Load `pd-foundations`: `compliance.md` (pillars, severity scale, honest claims), `accessibility.md`,
  `principles.md`, `project-profile.md`, and the adapter for the project's design tool
  (`tools/README.md`).
- Read `docs/design/PROJECT.md`. Note the accessibility target (`compliance.accessibility`, default WCAG 2.2 AA), any
  regulatory regimes, and the domain packs. If it is missing, proceed with defaults, record them as
  assumptions in the artifact, or ask `pd-design-lead`.
- Read the design artifact and the built UI or mocks (both required), plus every other upstream artifact
  that exists (optional); QA records which it had and which it lacked.

## When to use

- Before declaring a design effort complete.
- To audit an existing screen, flow, or build.

**Not for:** fixing the findings (route back to the owning specialist) or growing the design system
(`pd-design-system-ops`).

## Process

1. Gather the artifacts, the UI or mocks, and the requirement's acceptance criteria (see `ref:` and
   `integrations.md`).
2. Run each applicable audit below and log findings: location, pillar, severity, detail, recommendation.
3. State which pillars were active and which were not run, and why. Skipping one silently reads as a pass.
4. Summarize compliance scoped to what was tested.
5. Route fixes to the relevant specialist (system gaps go to `pd-design-system-ops`). Re-test after
   fixes by re-running the whole pillar the fix touched, since fixes often cause adjacent regressions.

## The audits

1. **Usability heuristics (always).** Walk 3-5 representative tasks end-to-end through the flow, not
   screens in isolation, and evaluate each step against NN/g's 10 heuristics. Task-free review yields
   false positives and negatives, so anchor every finding to the task and heuristic it breaks.
2. **Accessibility (always; level from PROJECT.md).** Automated scan, manual keyboard pass, focus
   visibility, contrast on real pairings, target sizes (SC 2.5.8, 24x24px min), screen-reader spot-check
   on the project's primary supported pairing, color-independent meaning, reflow at 400%/320px (SC
   1.4.10), plus the WCAG 2.2 criteria: Focus Not Obscured (2.4.11), Dragging Movements (2.5.7),
   Consistent Help (3.2.6), Redundant Entry (3.3.7), Accessible Authentication (3.3.8). Failures at the
   target level are defects (`accessibility.md`).
3. **Regulatory pillars (only when activated).** Run one per regime listed in PROJECT.md `compliance.regulatory`
   or required by a loaded domain pack (HIPAA is one example; GDPR and PCI are others), using the
   pack's checks. For HIPAA-style regimes, that means sensitive-data exposure in URLs, logs, analytics,
   notifications and previews, masking, role-based views, and session timeout. Recommend formal
   security or legal review; design audit cannot certify compliance.
4. **Design-vs-spec.** Check the build against the design, content, visual, and component artifacts and
   against the requirement's acceptance criteria, one criterion at a time with a pass/fail each. Token
   fidelity (no raw values where a token exists, no near-miss colors that look right but are not the
   bound token), real components and variants, all states present (empty, loading, error), copy
   matching `*-content-*.md`, motion matching `*-prototype-*.md` where one exists.
5. **Rendered-output audit (if frames or a build exist).** Clipping, overflow, color tokens, real icons,
   column alignment. Use the audit in the design tool's adapter (`tools/README.md`) for design frames, or
   `tools/code.md` to check the rendered build and component stories. With no design tool, audit screenshots of the build.

## Output

`<artifacts_dir>/<date>-qa-<topic>.md` with the artifact header (`ref:` the requirement; `upstream:` all
consumed files), then:

| ID | Area/Screen | Pillar | Severity | Detail | Recommendation | Status |
|----|-------------|--------|----------|--------|----------------|--------|

Severity uses the shared scale in `compliance.md` (Critical, High, Medium, Low). Add a compliance
summary listing what was tested and what was not, for example "No failures found in the checks performed on the 6 audited
screens (automated scan, keyboard and contrast pass); screen reader tested on one pairing only; criteria
not tested: captions, time limits; regulatory pillar not run (none active)". Say "conforms to WCAG 2.2
AA" only after a complete, evidenced evaluation of the stated scope. End with a
sign-off status. Scope every claim to what was tested; avoid "fully accessible" or "compliant", and
flag uncertainty (`working-agreement.md`).

## Domain packs

If `PROJECT.md` lists domain packs, read each pack's section for QA and apply it on top of this skill.

## Common mistakes

- Rubber-stamping, or checking only the happy path.
- Overclaiming compliance beyond the tested scope.
- Running a regulatory pillar nobody activated, or skipping one that was activated.
- Findings without a location or a recommended fix.
- Not re-testing after fixes.
