# Penpot adapter

Penpot is an open-source, browser-based design tool, self-hostable, built on SVG and CSS-oriented
concepts (flex and grid layout). Use this when `design_tool` is `penpot`. This adapter was written from
general knowledge, not a live session. Verify current Penpot docs and whatever MCP is connected before
relying on any claim.

## Detect

- Repo files: exported `.penpot` files, SVG exports, a tokens JSON file.
- Brief: URLs on `design.penpot.app` or a self-hosted Penpot host.
- MCP/API: Penpot has an API, and community MCP servers exist. Use one only if it appears in the
  session's tool list; read its tool schemas before assuming names.

## Capabilities

Typical; verify in session. Depends on the connected server, not on Penpot itself.

- Read system: often yes via API or MCP (tokens, components, styles).
- Write canvas: depends on the server; some are read-only.
- Render/screenshot: often via export; verify.
- Inspect bindings: Penpot's inspect tab shows tokens and CSS; programmatic access varies.
- Prototype: Penpot has interactions and flows in the app; MCP coverage unknown.
- Export: SVG, PNG, JPG, PDF from the app.

## Read the system

- Design tokens: Penpot has native tokens, stored in the W3C DTCG format (verify current docs for token
  types supported and import/export). Prefer the exported tokens JSON when no MCP is connected.
- Components and variants live in the file's assets; library files can be shared across files.
- Quote token and component names exactly. Aliases (a semantic token pointing at a primitive) resolve to
  the semantic name.

## Write

If a write-capable server is connected, build with token-bound values, real component instances, and
layout (flex or grid) rather than fixed positions, per `design-system.md`. Without one, produce a spec
and an HTML/CSS prototype (`manual.md`) and hand the user the steps to apply it. Penpot's CSS-native model
makes the code prototype a close fit for the eventual design.

## Audit

Follow the contract in `README.md`: every frame, bindings over looks. Penpot's inspect panel shows
whether a value is a token reference; if you can only see images, the binding and instance checks cannot
be done, so say so. Clipping, overflow, and alignment can be checked from screenshots. Two attempts, then
a blocking gap in `SYSTEM-BACKLOG`.

## Export & handoff

SVG and CSS are native, so handoff to code is direct: exported SVG for icons and artwork, tokens JSON
mapped to CSS variables or a Tailwind config (`pd-handoff`). Self-hosted projects may have other export
paths; verify.

## Known quirks

Unverified here. Record what you observe in the session, with the Penpot version.
