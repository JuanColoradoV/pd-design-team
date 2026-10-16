# Figma adapter

How the team reads from and writes to Figma through an MCP connection. Use this when `design_tool` in
`PROJECT.md` is figma. Tool names and behavior below were observed with the Figma desktop MCP; verify
them against what your connection exposes, since they may have changed.

## Detect

- Brief: URLs like `figma.com/design/:fileKey/:name?node-id=1-2` (also `/file/`, `/board/` for FigJam).
- Repo: Code Connect files, or tokens exported from Figma variables.
- MCP: Figma tools (`get_design_context`, `get_metadata`, `get_variable_defs`, `get_screenshot`, and a
  write tool such as `use_figma`) in the session's tool list. Names vary by server; check, don't assume.
  If none are connected, use the fallback ladder in `README.md`.

## Capabilities

Typical; verify in session.

| Capability | Typical |
|------------|---------|
| Read system | yes: variables, styles, components |
| Write canvas | yes, through the write tool |
| Render/screenshot | yes: `get_screenshot` |
| Inspect bindings | yes: `get_design_context` shows variable bindings and component references |
| Prototype | limited; verify |
| Export | images and code references; Code Connect where available |

## Read the system

| Tool | Use for |
|------|---------|
| `get_metadata(fileKey, nodeId)` | Structure overview: node ids, names, types, positions, sizes. |
| `get_design_context(fileKey, nodeId)` | Primary read for a node: reference code, variable bindings, screenshot. Best for "what is this and which tokens does it use." |
| `get_variable_defs(fileKey, nodeId)` | Token and variable values. |
| `get_screenshot(fileKey, nodeId, maxDimension)` | Visual render, often a short-lived URL to download. Raise `maxDimension` for fine detail. |

From a URL `.../design/:fileKey/:name?node-id=1-2`, take `fileKey` and `nodeId` `1:2`.

## Write

Write calls (such as `use_figma`) are easy to get subtly wrong. If external Figma skills are available
in your runtime (for example skills for general Figma writes, creating a file, generating a design,
building a library, or FigJam diagrams), load the matching one before the call. If they aren't, read
the tool's own schema and docs first.

When writing, bind Figma variables and styles, use the project's semantic text styles, and use real
component variants (`design-system.md`). If a needed token or variant is missing, stop, flag it to
`SYSTEM-BACKLOG`, and use the closest existing part with the substitution noted.

## Audit

Run this after each batch of frames, before the next task, for `pd-mocks` and any skill that renders
frames. The reason: a screenshot can look right while the bindings underneath are wrong (a raw hex that
resembles a token, a detached copy of a component), and those defects surface later as drift in
handoff. Audit every frame, not a sample.

For each frame, read `get_design_context` (and `get_metadata` where needed) plus `get_screenshot`:

1. **Text clipping** at any edge, including nested containers; sane wrapping.
2. **Overflow:** children sitting outside parent bounds, card to card.
3. **Color binding:** every fill and stroke resolves to a bound variable in the design context output,
   not just visually plausible. Look especially for near-miss colors that look right but aren't the
   bound token (two similar warm hues, an off-white one step from the surface token).
4. **Icons are real shapes:** no placeholder geometry (a magnifier has a handle, arrows have heads),
   preferably real instances from the system's icon set.
5. **Column alignment:** sibling columns in a row share widths.
6. **Instance integrity:** every element meant to be a system component is an actual instance of the
   named component (main-component reference present), not a detached or hand-assembled lookalike.
7. **Type-style binding:** every text layer uses the bound text-style object, not a local override that
   matches size and weight by eye.

Report findings in one table and fix before the next batch:

| Frame | Issue type | Detail | Severity |
|-------|-----------|--------|----------|
| ... | Text clipping | CTA label clipped on right edge | High |

Use the severity scale in `compliance.md`. If a finding can't be fixed with real system parts after two
attempts (for example no matching icon exists), log it to `SYSTEM-BACKLOG` as a blocking gap and note
the unresolved finding in the artifact; don't ship a fabricated substitute silently.

## Export & handoff

Screenshots and design context feed `pd-handoff`; Code Connect maps components to code where the project
uses it and it is available (`pd-handoff`).

## Known quirks

- `get_variable_defs` returned variables for the layer currently selected in the Figma desktop app, not
  for an arbitrary node id. On a "nothing selected" error, ask the user to select the relevant tokens
  frame in Figma, then retry.
- `get_metadata` with no node id returned only a subset of pages. Drill by a node id taken from the
  file URL instead of trusting the page list.
