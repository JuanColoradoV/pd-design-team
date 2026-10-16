# Design system contract

The same contract applies whatever tool holds the system: Figma, Penpot, Pencil, Sketch, Framer, tokens and components in code,
or nothing yet. Tool mechanics live in the adapters (`tools/README.md`).

## The contract

1. **The live system is the source of truth.** Not a remembered snapshot, not a doc written months ago.
   Re-sync before work that applies the system; it changes.
2. **Bind, don't hardcode.** Colors, spacing, radii, and shadows reference tokens. Never paint a raw
   hex or type a raw px where a token exists.
3. **Use semantic type roles.** Pick the type style by its role (heading, body, label), not by matching
   size and font by eye.
4. **Use real component variants by real property names.** Resolve the actual component and its actual
   property axes, rather than approximating ("a blue button").
5. **Never invent names.** If you can't find a token, style, or variant, it doesn't exist for you yet.
6. **Flag gaps.** Add the gap to `SYSTEM-BACKLOG` with severity and a blocking flag (see
   `handoff-protocol.md`). If it isn't blocking, use the closest existing part and note the substitution
   in your artifact; if it is, stop that element and route it to `pd-design-system-ops`. `pd-design-system-ops` decides what grows.
7. **Re-sync first.** Read the current tokens, type roles, and components at the start of each effort.

Example names below are illustrative: `role/body/default`, `color/text/primary`, `space/4`,
`kind=primary, size=md, state=default`. The real names come from the project's system.

## Where the system is declared

`PROJECT.md`, field `design_system`: `source` (`figma`, `penpot`, `pencil`, `sketch`, `framer`, `code`, or
`none`) and `locations` (file URLs or paths), plus the top-level `conventions` for naming. If the field
is missing or stale, ask the user once and record the answer there rather than guessing.

## Discovering conventions on first contact

The first agent to touch a system learns its conventions; the next shouldn't have to. Record these in
`PROJECT.md` under the top-level `conventions` (`type_roles`, `tokens`, `component_props`):

- Type-role prefix and structure (for example `role/<group>/<variant>`, or a different scheme).
- Token naming pattern and categories (color, space, radius, shadow, motion), and how semantic tokens
  alias primitives.
- Component property axes and their allowed values (for example kind, size, state).
- Anything deprecated and what replaces it.

Verify each from the live source before writing it down; mark unverified items as such.

## Working with a design tool

Read and write recipes, quirks, and the audit are in the tool's adapter (`tools/README.md`). Most tools
map the same way: variables or tokens carry the values, text styles carry the roles, components carry the
variants (in Figma, variables, text styles, and component sets; in Sketch, Color Variables, Text Styles, and
Symbols).

## Code-based systems

Tokens live in CSS custom properties, JSON design tokens, a Tailwind config, or theme files; components
live in a library or Storybook. See `tools/code.md` for locating them and for render checks.

## No system yet

When `design_system.source` is `none`, the provisional system comes first, before any visual work, so
every later stage binds to names that already exist. Visual work needs tokens, and mapping to parts
needs the visual artifact, so neither can establish the system; `pd-design-system-ops` does, by
default:

1. Say so plainly and tell the user the work will use a provisional system.
2. `pd-design-system-ops` proposes a minimal provisional set, labeled provisional wherever it appears: a
   neutral type scale in roles (display, heading, body, label, caption), a restrained palette with
   text, surface, border, and accent roles plus status colors, and a spacing scale on a consistent
   base (for example `space/1` through `space/8`). Check text pairs against the contrast targets in
   `accessibility.md`.
3. Get the user's agreement, then write it to `<artifacts_dir>/<date>-components-provisional-system.md`
   with status `draft` and a named owner (the person who approves changes to it). Point
   `design_system.locations` in `PROJECT.md` at that file and record the naming under `conventions`;
   `source` stays `none` until a real system exists.
4. The normal pipeline then runs against it: visual binds to its tokens, and `pd-design-system` maps
   to its parts and flags gaps to the backlog like any other system.
5. Treat every value as replaceable: reference tokens by name in artifacts so a real system can swap in.
   The owner grows it through `pd-design-system-ops`, and when a real system is built, `source` and
   `locations` change and the provisional file is superseded.
