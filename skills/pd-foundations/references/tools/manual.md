# Manual adapter (no design tool connected)

Use this when `design_tool` is `none`, or the tool exists but no MCP or API is connected. The team still
works; it works from what the user can give it and is explicit about what it could not check.

## Detect

- `PROJECT.md` says `none`, or the session's tool list has no adapter's tools for the tool in use.
- The user pastes screenshots, SVG, a tokens JSON, or inspect-panel values instead of links.

## Capabilities

All typical; verify in session.

- Read system: from pasted tokens JSON, CSS variables, or inspect values. Not from a link.
- Write canvas: not available. Deliver specs and a code prototype.
- Render/screenshot: you can view images if the model has vision; you can render your own HTML.
- Inspect bindings: not available from images. Only values the user pastes.
- Prototype: an HTML/CSS/JS prototype.
- Export: files you write to the repo.

## Read the system

Ask for the smallest useful set: a tokens JSON or CSS variables file, a screenshot of the type and color
styles, and inspect-panel values (font, size, weight, line height, color token name) for specific
elements. Quote names the user gives you exactly; mark any name you inferred from an image as inferred.
With no system at all, use the provisional-system path in `design-system.md`.

## Write

Produce two things:

1. A spec: per screen, the layout, the real token and component names for each part, and all states.
2. An HTML/CSS (or framework) prototype that uses the real tokens as CSS variables, so the prototype is
   built on the same values the designer's file holds. Follow `code.md` for rendering checks.

Do not present the prototype as the design file. Say which names are confirmed and which are provisional.

## Audit

Run what the inputs allow. From images and a rendered prototype you can check text clipping, overflow,
column alignment, contrast, and token use in your own code. You cannot verify that a layer in the user's
file is bound to a token, that an element is a real component instance rather than a detached copy, or
that text uses a named style. List these as not performed in the artifact, with severity, and ask the user
to confirm them in the tool's inspector. Use the report table in `README.md`, and the two-attempt rule.

## Export & handoff

Hand off the spec, the prototype files, and a tokens file. Offer the user a checklist for the checks you
could not run.

## Known quirks

- A screenshot cannot show a near-miss color against the real token; ask for the token name or hex.
- Vision on a downscaled image misreads small type; request crops at full resolution for detail.
