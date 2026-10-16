# Pencil adapter

Pencil (pen.dev) is a canvas design tool whose documents are `.pen` files. Use this when `design_tool` is
`pencil`. Tool names and behavior below were observed October 2026 in a live Pencil MCP session by reading its
skill docs and app state; anything not marked verified is taken from those docs and was not exercised.

## Detect

- Repo files: `*.pen` files. Follow the connected MCP's own instructions for access. If it states that
  files are encrypted and MCP-only (observed October 2026), use only the MCP tools and never a file
  reader or grep. Otherwise read-only inspection is acceptable, since the vendor docs
  (docs.pencil.dev/core-concepts/pen-files) describe a readable JSON format. Writes always go through
  the tool, never by editing the file directly.
- Brief: mentions of pencil.dev, pen.dev, or a `.pen` path.
- MCP: tools named `mcp__pencil__*` (verified set: `get_app_state`, `read_skill`, `execute`, `get_style`,
  `browser`). If they are not in the session's tool list, use the fallback ladder in `README.md`.

## Capabilities

Typical; verify in session.

| Capability | Offered | Via |
|------------|---------|-----|
| Read system | yes | `execute` with `GetVariables()` and `Get(...)` |
| Write canvas | yes | `execute` (`Insert`, `Copy`, `Update`, `Replace`, `Move`, `Delete`, `SetVariables`) |
| Render/screenshot | yes | `TakeScreenshot` inside `execute`; `browser` can screenshot live pages |
| Inspect bindings | yes | `Get` returns `$variable` references; `resolveVariables` returns computed values |
| Prototype | not documented | treat as unavailable |
| Export | yes | `Export` to PNG, JPEG, WEBP, PDF, or HTML (Tailwind or CSS) |

## Read the system

1. Call `get_app_state` (read-only) for the active file, selection, top-level frames, and reusable
   components with their ids. The document can change while you work; re-read before relying on a
   remembered id.
2. Call `read_skill` first for the schema and `execute` rules, then `read_skill` with a `path` for the
   topic guide you need (such as "guide/design-system", "guide/components", "guide/code", and others
   listed in the skill index). The schema is required reading; a property absent from it is unsupported.
3. In `execute`, `Print(GetVariables())` lists tokens and themes. Read a component with
   `Print(Get(id))`; read an instance's expanded tree with `resolveInstances: true`. Slots are marked by a
   `slot` property listing recommended components.

Variable names are the project's real names; reference them with a `$` prefix in properties.

## Write

- Pass `filePath` to the MCP calls to target a `.pen` file. Do not modify a design file you were not
  asked to change.
- Build with variables (`fill: "$text-primary"`), component instances (`type: "ref"` with `descendants`
  overrides), and flexbox-style layout (`fill_container`, `fit_content`) instead of hardcoded sizes.
  Name every node. Create variables with `SetVariables` only after reading existing ones, since a merge
  can overwrite.
- Screens are top-level frames with `clip: true`; components sit above, screens below and to the right.
  Mark new root frames `placeholder: true` until finished.
- `execute` snippets are JavaScript, each call in its own scope, reverted wholly on error. Fix a failed
  call with `edits` and the `editId` from the failure message rather than resending.
- Missing token or variant: stop, add to `SYSTEM-BACKLOG`, use the closest existing part, note it.
- `get_style` offers ready-made style archetypes; use one only when the project has no system or brand.

## Audit

After each batch of frames, in `execute`, then `TakeScreenshot` of the frame:

- Clipping and overflow: `Get(frame, visitor)` exposes `ctx.problems` (`partially clipped`,
  `fully clipped`) and `ctx.bounds`. Verified in docs; run it on every frame.
- Binding: walk the subtree without `resolveVariables` and flag any `fill`, `stroke`, `gap`, `padding`,
  or `fontFamily` that is a literal where a variable exists. Near-miss colors only show up this way.
- Instance integrity: nodes meant to be system parts must be `ref` nodes pointing at the component id,
  not frames copied by hand.
- Type-style binding: Pencil text carries font properties (and variables for them) rather than a named
  style object in the docs read; check text uses font, size, and weight variables where the system
  defines them, and say which convention the project uses.
- Icons: use `icon` nodes from the supported libraries, not drawn shapes.
- Alignment and contrast: structural checks by `Get`, visual by screenshot.

Report in the table from `README.md`. After two failed fixes, log a blocking gap.

## Export & handoff

`Export` writes PNG, JPEG, WEBP, PDF, or HTML (`html-tailwind`, `html-css`) to a path you give; the
the "guide/code" and "guide/tailwind" topics cover code generation. Use exports for `pd-handoff`
deliverables, not to check your work.

## Known quirks

From the tool's own docs, not independently reproduced:

- No percentage sizes, margins, or baseline/stretch alignment; no CSS thinking.
- Text has no fill by default and is invisible until one is set.
- Properties do not cascade from parent to child.
- Descendants of a copied node must be overridden in the `Copy` call, because ids change.
- `Generate` (AI images, SVG) needs a signed-in user; `get_app_state` shows the account state.
- Not verified here: any write call, `Export`, `get_style` output, `browser` actions.
