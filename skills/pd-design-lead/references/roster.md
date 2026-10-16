# Team roster — who does what

Each specialist loads `pd-foundations`, reads `PROJECT.md` and its declared input artifacts, does its
work, and writes its output artifact per `handoff-protocol.md`. Inputs not marked "(optional)" are
required, or replaceable by stated assumptions where noted; the rules for a missing input are in
`handoff-protocol.md` under "Missing inputs". File patterns are `*-<discipline>-*.md`.

## `pd-ux-research`
- **Does:** discovery, interviews/survey design, synthesis, personas, jobs-to-be-done, opportunity
  framing, competitive/heuristic review.
- **Reads:** the brief / problem statement; prior research (optional).
- **Writes:** `*-research-*.md` (findings, personas, JTBD, opportunities, open questions).
- **Call when:** the problem or users aren't well understood; assumptions need validating.
- **Skip when:** the problem is well-understood and evidence already exists (reuse the prior artifact).

## `pd-ux-architecture`
- **Does:** content modeling (OOUX), taxonomy/controlled vocabulary, sitemaps, navigation models,
  findability (card sorting, tree testing).
- **Reads:** research (replaceable by stated assumptions).
- **Writes:** `*-architecture-*.md`.
- **Call when:** content/objects or navigation need explicit structure, or findability is failing
  (duplicate labels, users can't find something that exists).
- **Skip when:** the product's structure already exists and isn't changing — reuse the prior artifact.

## `pd-ux-flows`
- **Does:** user flows, task flows, journey maps.
- **Reads:** research (replaceable by stated assumptions); architecture (optional; flows trace paths
  through the structure it defines).
- **Writes:** `*-flows-*.md`.
- **Call when:** the experience spans multiple steps/screens and the sequence, branching, or
  decision logic between them needs mapping.
- **Skip when:** changing a single isolated component or copy string.

## `pd-ux-design`
- **Does:** wireframes, layout, interaction design, screen specs, states.
- **Reads:** flows and research (each replaceable by stated assumptions, as for a single screen);
  architecture (optional).
- **Writes:** `*-design-*.md`.
- **Call when:** screens/interactions need to be designed or redesigned.
- **Skip when:** the change is purely copy, purely visual token, or purely a system change.

## `pd-ux-writing`
- **Does:** microcopy, labels, button/CTA text, errors, empty states, notifications, voice & tone.
- **Reads:** design; flows (optional).
- **Writes:** `*-content-*.md`.
- **Call when:** any user-facing text exists. Runs in parallel with visual.

## `pd-visual-design`
- **Does:** applies type/color/spacing/hierarchy/brand via design-system tokens.
- **Reads:** design; content (optional).
- **Writes:** `*-visual-*.md`.
- **Call when:** a screen needs visual treatment beyond wireframe. Runs in parallel with writing.

## `pd-design-system` (consume)
- **Does:** maps the design to the live system's real type roles, tokens, and component variants;
  specs exactly which parts to use.
- **Reads:** design + visual.
- **Writes:** `*-components-*.md`.
- **Call when:** translating a design into concrete system parts, or before mocks.

## `pd-design-system-ops` (steward)
- **Does:** grows & guards the system — triages flagged gaps, reviews proposed token/component changes,
  QAs the system itself, manages deprecation/versioning, updates the live system.
- **Reads:** by mode — triage and review read `<artifacts_dir>/design-system/SYSTEM-BACKLOG.md` and the
  live system; Mode 0 (empty project) needs only `PROJECT.md` and the brief.
- **Writes:** `<artifacts_dir>/design-system/CHANGELOG.md`; updates `conventions` in `PROJECT.md`;
  `<date>-components-provisional-system.md` when no system exists; `*-components-*.md` review output
  (topic such as `system-review`).
- **Call when:** a gap is flagged, on a cadence to review/QA the system, or at the start of an empty
  project (`design_system.source: none`) before any visual work. Otherwise a side loop.

## `pd-mocks`
- **Does:** builds mocks in the project's design tool (Figma, Penpot, Pencil, …) or in code with real components;
  runs the rendered-output audit.
- **Reads:** design (lo-fi); design + content + visual + components (hi-fi); responsive (optional).
- **Writes:** rendered mocks + `*-mocks-*.md` (links + audit results).
- **Call when:** a visual artifact is needed.

## `pd-ux-qa`
- **Does:** heuristic evaluation, accessibility audit, regulatory audit when a pillar is active, and
  design-vs-spec QA against the requirement's acceptance criteria.
- **Reads:** design + the built UI/mocks; every other upstream artifact that exists (optional).
- **Writes:** `*-qa-*.md` (findings by severity).
- **Call when:** before declaring any design effort done; or to audit existing work.

## `pd-responsive`
- **Does:** breakpoints, fluid/adaptive layout, touch targets, platform conventions.
- **Reads:** design; flows (optional).
- **Writes:** `*-responsive-*.md`.
- **Call when:** the design must work across sizes/devices/platforms. Often parallel with writing/visual.

## `pd-prototyping`
- **Does:** interactive/clickable prototypes + purposeful motion.
- **Reads:** design + flows; mocks (optional; a prototype can be built from design specs).
- **Writes:** `*-prototype-*.md` (+ the prototype itself).
- **Call when:** a clickable flow or motion is needed for testing or stakeholder review.

## `pd-handoff`
- **Does:** dev-ready specs, redlines, asset export, token/component→code mapping (with the design tool's code-mapping feature where available).
- **Reads:** design + content + visual + components + mocks + qa; responsive and prototype (optional).
- **Writes:** `*-handoff-*.md`.
- **Call when:** an approved, QA-passed design goes to engineering.

## `pd-metrics`
- **Does:** success metrics, instrumentation specs, guardrails, honest result-reading from the analytics source.
- **Reads:** design; research (replaceable by goals from the requirement, stated as assumptions).
- **Writes:** `*-metrics-*.md`.
- **Call when:** defining how to measure success, or evaluating impact after ship. Side loop.
