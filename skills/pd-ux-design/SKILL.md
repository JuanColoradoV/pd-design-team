---
name: pd-ux-design
description: >-
  Use when screens or interactions need to be designed or redesigned: wireframes, layout, visual
  hierarchy, interaction design, component composition, screen specs, and the full set of states
  (default, loading, empty, error, success, partial, disabled). Consumes flows and binds to the live
  design system. Part of the pd-* design team.
metadata:
  team: product-design
  role: ux-design
  version: "2.0.0"
---

# pd-ux-design — screens that realize the flow

## Overview

Design the screens and interactions that carry out the flow: layout, hierarchy, affordances, behavior,
and every state, not only the happy default. Compose from the project's real design system. Inventing a
component or token produces work that cannot be built or verified, so flag the gap instead.

## Before you start

1. Load `pd-foundations`: `principles.md`, `accessibility.md`, `design-system.md`, `handoff-protocol.md`.
2. Read `docs/design/PROJECT.md` (design system location, naming conventions, design tool). If it is
   missing, proceed with defaults and record them as assumptions, or ask `pd-design-lead` to set it up.
3. Read the upstream flows artifact (`*-flows-*.md`), plus research and architecture if present
   (architecture is optional). Flows and research may be replaced by stated assumptions when the user
   accepts that, as for a single screen; list them in your artifact. Pull the requirement from the
   tracker named in `PROJECT.md` (see `integrations.md`).

## When to use

- Screens or interactions need designing or redesigning.
- A flow needs to become concrete layouts and behaviors.

**Not for:** copy (`pd-ux-writing`), applying visual tokens (`pd-visual-design`), building frames in the
design tool (`pd-mocks`), or system changes (`pd-design-system-ops`).

## Process

1. **Pull the flow and goals**: the steps, decisions, and states this design must cover.
2. **Inventory screens by state**: default, loading, empty, error, success, partial, disabled,
   no-permission. This list is the spec's backbone. Then check combinations: can a control be disabled and
   loading (retry after failure)? focused and error (validation on an active field)? partial and
   no-permission? Spec the combination; states are not mutually exclusive.
3. **Lay out**: grid, spacing rhythm, hierarchy. One primary action per screen; subordinate the rest.
   Group by task, not by data type.
4. **Compose from real components** with their real variants (for example `kind=primary, size=md,
   state=default`; actual property names come from the project's system). If a needed component or
   variant is missing, flag the gap with severity and a blocking flag (it feeds `pd-design-system-ops`).
   When it isn't blocking, use the closest existing one and note the substitution; when it is, stop that
   element and say so.
5. **Design the interaction**: affordances, feedback for every action, sensible defaults, forgiving input,
   confirmation for destructive or irreversible actions. Specify transitions as what changes and in what
   order, not easing or duration; hand motion timing to `pd-prototyping`.
6. **Apply Fitts's and Hick's laws.** Fitts: acquisition time depends on size and distance, so put the
   primary action large and within the user's current focus or thumb reach. Screen edges only act as
   "infinite" targets at the OS level; in browsers and on touch screens they sit next to chrome and
   system gestures, so don't rely on them. Hick: decision time grows with the number of unfamiliar,
   unordered options, so reduce or group choices at a decision point and disclose the rest progressively.
   There is no magic number ("7±2" is about working memory, not choice); a long but well-ordered list
   (alphabetical, grouped, searchable) can be fine.
7. **Spec every state**: empty, loading, error, and partial shown, not just the populated view.
8. **Annotate**: behavior, validation rules, focus order, keyboard interaction, accessible names, target
   sizes, and focus destination on state change (for example where focus lands when a validation error
   appears, and that it stays visible per WCAG Focus Not Obscured; see `accessibility.md`). These
   annotations are how `pd-mocks` and engineering get it right.
9. **Self-check** against `principles.md` (hierarchy, one job, recognition) and `accessibility.md`
   (focus, contrast intent, targets, color-independent meaning).

## Fidelity

Work at wire-to-mid fidelity: structure, hierarchy, behavior. Visual treatment through tokens is
`pd-visual-design`; frames in the design tool are `pd-mocks`. Describe layout and components precisely
enough to build with or without a design tool.

For high-stakes products, make the most frequent path the most efficient, confirm irreversible actions,
make status unambiguous without relying on color, and design for incomplete data and poor connectivity.

## Output

`<artifacts_dir>/<date>-design-<topic>.md` with the artifact header from `handoff-protocol.md`
(`discipline: design`), then per screen: purpose, layout, components used (real names and variants), each
state, interactions, annotations (validation, focus order, accessibility), and flagged gaps. List the
components used so `pd-design-system` can verify them. `upstream:` the artifacts actually consumed — flows, plus research and
architecture if they were used. `downstream:` `content`, `visual`, `components`, `responsive`, `mocks`, `prototype`,
`qa`, `handoff`, `metrics`.

## Domain packs

If `PROJECT.md` lists domain packs, read each pack's section for design and apply it on top of this
skill.

## Common mistakes

- Designing only the default state.
- Inventing components or tokens instead of using, or flagging gaps in, the real system.
- Decoration competing with hierarchy; more than one primary action.
- Skipping focus order, target sizes, and accessible names.
- Losing context across a state transition (loading, error, retry): scroll position, entered values, or
  selection reset instead of preserved.
- Relying on hover as the only way to reveal an action or tooltip, which fails on touch devices.
