# Sketch adapter

Sketch is a macOS design tool; documents are `.sketch` files. Use this when `design_tool` is `sketch`.
This adapter was written from general knowledge, not a live session. Verify the current Sketch docs and
any connected MCP.

## Detect

- Repo files: `*.sketch` (a zip archive of JSON), exported tokens or assets.
- Brief: Sketch Cloud or workspace links, or a mention of Sketch libraries.
- MCP: availability is uncertain. Use one only if it appears in the session's tool list. Sketch runs on
  macOS only, so a remote or Linux session usually has no access to the app.

## Capabilities

Typical; verify in session. Without an MCP, assume none of these are available to you directly.

- Read system: possible via a connected server or by parsing exported files.
- Write canvas: only with a write-capable server.
- Render/screenshot: export from the app, or ask the user.
- Inspect bindings: in the app, the inspector shows which style or variable a layer uses.
- Prototype: Sketch has prototyping links; programmatic access uncertain.
- Export: PNG, SVG, PDF, and slices via the app.

## Read the system

The reusable parts in Sketch are Libraries (shared documents), Symbols with overrides, Color Variables,
and Text Styles and Layer Styles. Read them by name from the library or from user-provided exports.
Symbols are the component equivalent: overrides are the property axes, so list which overrides each
symbol exposes. Quote names exactly.

## Write

With a write-capable server, build with real symbols, library styles, and color variables rather than
local values. Without one, deliver a spec and a code prototype (`manual.md`) and name the symbol and style
to use for each element so the designer can place them.

## Audit

Follow `README.md`. In the app, check that layers use a Text Style and a Color Variable (not a
detached or local value), that symbols are linked to the library (not detached), and that nothing clips
outside its artboard. From images alone, only clipping, overflow, and alignment are checkable; state that
the binding checks were not performed.

## Export & handoff

Export slices as SVG or PNG; derive tokens from Color Variables and styles into a tokens file for
`pd-handoff`. Sketch's own handoff, if the team uses it, is outside this adapter.

## Known quirks

Unverified. A frequent one in practice: symbols detached from the library look identical but stop
receiving updates, so check the link, not the look.
