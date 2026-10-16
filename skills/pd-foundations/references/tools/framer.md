# Framer adapter

Framer is a site and prototype builder: pages, components with variants, styles and color tokens, code
components written in React, and one-click publishing. Use this when `design_tool` is `framer`. This
adapter was written from general knowledge, not a live session. Verify current Framer docs and any
connected MCP.

## Detect

- Repo files: usually none; Framer projects live in Framer. Code components may be exported as `.tsx`.
- Brief: `framer.com/projects/...` links or a published `*.framer.app` / custom domain site.
- MCP: availability uncertain; use one only if it appears in the session's tool list. Framer also has a
  plugin API, which is a separate path from MCP.

## Capabilities

Typical; verify in session.

- Read system: styles and tokens via a connected server or the plugin API; otherwise from the editor.
- Write canvas: only with a write-capable server or plugin.
- Render/screenshot: the published or preview URL can be screenshotted with a browser tool.
- Inspect bindings: visible in the editor; programmatic access uncertain.
- Prototype: native, since Framer pages are the prototype.
- Export: publish to a URL; copy components; code components as React.

## Read the system

Color styles and text styles are the tokens; components with variants are the parts. Code components
expose property controls that act as the prop axes. Quote names exactly, and record them in `PROJECT.md`.

## Write

Build with real components and their variants, color and text styles, and stack (flex) layout with
responsive breakpoints, per `design-system.md`. Because Framer ships what you build, a missing token is a
real production gap: flag it to `SYSTEM-BACKLOG` before substituting. Code components are the escape hatch
when a variant does not exist, but they bypass the visual system, so note them as exceptions.

## Audit

Follow `README.md`. Use the preview or published URL at each breakpoint to check clipping, overflow, and
alignment, and a browser's computed styles to see whether values trace to the style tokens. Instance and
style-binding checks need the editor or a connected server; otherwise state that they were not performed.

## Export & handoff

The site itself is the deliverable, so handoff is often a URL plus a spec of components, variants, and
CMS or code-component dependencies. If the product is built elsewhere, export assets and map styles to
tokens for `pd-handoff`.

## Known quirks

Unverified. Responsive variants and breakpoint overrides are a common source of drift; check each.
