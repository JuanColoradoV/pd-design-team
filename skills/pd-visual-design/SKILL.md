---
name: pd-visual-design
description: >-
  Use when a design needs visual treatment: applying typography, color, spacing, hierarchy, elevation,
  radius, and brand expression through the project's design-system tokens, or when a screen needs a
  restyle, contrast fix, or hierarchy repair. Consumes the design; runs in parallel with writing.
metadata:
  team: product-design
  role: visual-design
  version: "2.0.0"
---

# pd-visual-design — make hierarchy visible, with tokens

## Overview

Apply type, color, space, and elevation so the most important thing looks the most important, with
restraint over decoration. Bind to the system's real tokens rather than raw hex or px values: tokens keep
the design consistent, themeable, and traceable to code.

## Before you start

- Load `pd-foundations`: `design-system.md` (the bind-to-the-live-system contract), `accessibility.md`
  (contrast), `principles.md`. For reading the system see the adapter for the project's design tool
  (`tools/README.md`), as `PROJECT.md` declares.
- Read `docs/design/PROJECT.md` (`design_system`, `design_tool`, `compliance.accessibility`). If missing,
  proceed with defaults (WCAG 2.2 AA, no system) recorded as assumptions, or ask `pd-design-lead`.
- Read the upstream `*-design-*.md` (required), and `*-content-*.md` (optional) if writing has produced
  one.

## When to use

- A wireframe or screen needs visual treatment beyond structure.
- An existing screen needs a restyle, contrast fix, or hierarchy repair.

**Not for:** mapping to exact components and variants (`pd-design-system`), or changing the system itself
(`pd-design-system-ops`).

## Process

1. **Read the live system first.** It evolves, so pull current type, color, and spacing tokens before
   applying them; a remembered list goes stale. When `design_system.source` is `none`, bind to the
   provisional system that `pd-design-system-ops` established before visual work (named in
   `design_system.locations`); if none exists, stop and ask `pd-design-lead` to schedule it first. Writing
   runs in parallel, so use realistic-length copy from its inventory, or design flexible,
   truncation-safe containers; reconcile mismatches at the `mocks` stage.
2. **Typography:** assign a type style to every text element (example convention: `role/heading/default`,
   `role/body/default`, `role/caption`). Use no deprecated styles. If the scale skips steps or lacks a
   consistent ratio (roughly 1.125-1.333), flag it to `pd-design-system-ops` instead of inventing an
   in-between size.
3. **Color:** use semantic tokens by name (example: `color/text/primary`), never a raw value. Guard
   near-miss colors, tokens that look right but aren't the bound one (adjacent hues, a warning/error
   pair): check the intended token against its documented meaning before applying.
4. **Spacing and rhythm:** find the base unit (commonly 4 or 8) and use only its multiples (example:
   `space/4`). Keep the layout grid (columns, gutters) separate from the spacing scale (gaps, padding).
   Group related content, separate unrelated content.
5. **Elevation and radius:** use the system's tokens, and keep elevation consistent with stacking order
   (modals above popovers above cards above base).
6. **Brand expression:** apply accent color, imagery style, and motion signature deliberately and
   sparingly; it should reinforce hierarchy, never compete with it.
7. **Hierarchy check:** squint test. Does the primary action or key content dominate?
8. **Contrast check:** verify the resolved pairing meets the target in every interactive state (default,
   hover, focus, active, disabled, error): 4.5:1 for text, 3:1 for large text and UI components in WCAG
   2.2 AA. A token can pass in default and fail on hover. Inactive (disabled) components are exempt
   from 1.4.3 and 1.4.11, so a low-contrast disabled state is not a WCAG failure; keeping disabled
   controls legible is team practice, not a WCAG requirement. Never let color carry meaning
   alone; add text or an icon.

## Output

`<artifacts_dir>/<date>-visual-<topic>.md` with the artifact header (`discipline: visual`; see
`handoff-protocol.md`), then: per element, type style + color token + spacing; elevation and radius
choices; contrast results (the pairings checked and their ratios); flagged gaps (missing token, to
`pd-design-system-ops` via the backlog) and substitutions used. `upstream:` design, content (if used).
`downstream:` `components`, `mocks`, `qa`, `handoff`.

## Domain packs

If `PROJECT.md` lists domain packs, read each pack's section for visual design and apply it on top of
this skill.

## Common mistakes

- Raw hex or px where a token exists; invented styles; deprecated styles.
- Decoration competing with hierarchy.
- Checking contrast on the token in isolation instead of the real foreground/background pair and state.
- Color as the only signal for status.
- Applying a remembered token list instead of reading the live system.
