---
name: pd-prototyping
description: >-
  Use when a design needs to become an interactive or animated prototype (clickable flows, transitions,
  micro-interactions, motion) for usability testing or stakeholder review, in any tool: design-tool
  prototypes or coded prototypes. Complements pd-mocks (static screens). Part of the pd-* design team.
metadata:
  team: product-design
  role: prototyping
  version: "2.0.0"
---

# pd-prototyping — bring the design to life

## Overview

Make the design **interactive** (clickable flows) and, where it adds meaning, **animated** (transitions,
micro-interactions), to validate with users or communicate intent. Fidelity matches purpose: a
throwaway test prototype is not a polished demo, and over-polishing the former wastes the time the
latter needs.

## Before you start

- Load `pd-foundations`: `design-system.md`, `accessibility.md`, `principles.md`, and the adapter for the
  project's tool (`tools/README.md`).
- Read `docs/design/PROJECT.md` for `design_tool` and the design system. If it is missing, proceed with
  defaults recorded as assumptions, or ask `pd-design-lead`.
- Read the upstream `*-design-*.md` and `*-flows-*.md` (both required), and `*-mocks-*.md` (optional; a
  prototype can be built from the design specs when mocks don't exist).
- If your runtime has a motion-design skill installed, use it for timing curves and motion review
  before finalizing a motion spec.

## When to use

- A clickable flow is needed (usability test, stakeholder buy-in).
- Motion, transitions, or micro-interactions need designing or specifying.

**Not for:** static screens (`pd-mocks`); running the usability test itself (pair with `pd-ux-research`).

## Fidelity: match to purpose

| Purpose | Fidelity |
|---------|----------|
| Usability test | Just enough to exercise the task |
| Stakeholder review | Higher visual and motion fidelity on the key moments |
| Dev reference for motion | Precise timing and easing, handed to `pd-handoff` |

## Motion principles

- **Purposeful.** Motion should orient, give feedback, show continuity, or guide focus; delight is fine
  used sparingly. Motion for its own sake slows people down.
- **Fast and unobtrusive.** Starting reference: micro-interactions (hover, toggle, press) ~100-200ms;
  enter/exit and small transitions ~200-300ms; page-level ~300-400ms; past ~500ms only as a deliberate
  exception.
- **Accessible.** Honor `prefers-reduced-motion` (or the platform's reduce-motion setting) by offering a
  reduced variant that swaps movement for fades or instant changes; nothing flashes more than 3 times
  per second. This matters most for older users and anyone with vestibular sensitivity.
- **Easing has meaning.** Ease-out for elements entering; ease-in for elements exiting; spring or
  ease-in-out for continuous or gesture-driven motion (drag, resize). Linear reads as mechanical.
- **Choreography.** When several elements animate together, stagger them ~20-40ms rather than moving in
  lockstep; it reads as intentional rather than as a glitch.
- **Consistent.** Reuse the system's motion tokens (easing, duration) if they exist; flag the gap if not.

## Process

1. **Gather** design, flows, and mocks if they exist; confirm the purpose and the fidelity it warrants.
2. **Wire interactions.** Connect screens into the flow with the tool's native means: prototype
   connections in a design tool, or a coded prototype (real components and real tokens, routed
   through the flow). Follow the adapter for write steps and prerequisites.
3. **Add purposeful motion** on the moments that benefit, consistently. Prefer animating `transform`
   and `opacity` (cheap to render, holds 60fps); flag any spec that animates layout properties
   (width, height, top, left) as a performance risk for `pd-handoff` to raise with engineering.
4. **Accessibility pass.** Reduced-motion variant, no flashing, focus order preserved through
   transitions.
5. **Document** what is interactive, each motion spec, and the purpose it serves; route to testing or
   review.

## Output

`<artifacts_dir>/<date>-prototype-<topic>.md`: handoff header (`discipline: prototype`), then the prototype
link or path, each interaction with its motion spec (timing, easing) and the purpose it serves
(orient, feedback, continuity, hierarchy), and accessibility notes. `upstream:` design, flows, and mocks if used.
`downstream:` `research` (testing), `qa`, `handoff` (motion specs).

Use de-identified sample data in shared prototypes.

## Domain packs

If `PROJECT.md` lists domain packs, read each pack's section for prototyping and apply it on top of
this skill.

## Common mistakes

- Motion for its own sake; inconsistent easing or durations across the flow.
- Ignoring `prefers-reduced-motion` or the platform equivalent.
- Over-polishing a throwaway test prototype.
- Prototyping without a stated purpose or fidelity target.
- Specifying motion as "smooth" or "quick" instead of durations and easing curves.
