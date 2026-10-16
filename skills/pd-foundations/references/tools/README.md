# Design-tool adapters

The team talks in capabilities ("the design tool", "the live system"). An adapter maps those
capabilities onto one concrete tool. Pick the adapter named by `design_tool` in `PROJECT.md`; if the field is
missing, run each adapter's Detect step and record the result. Every adapter uses the sections below in this
order, so a specialist can jump to the same heading in any of them.

## The contract

1. **Detect.** How to tell the tool is in play: files in the repo, URLs in the brief, and connected MCP
   tools. Check the session's actual tool list; a tool name you remember may not be connected, and the
   same tool may be exposed under a different name.
2. **Capabilities.** Which of these the tool offers through its MCP or API: read system, write canvas,
   render/screenshot, inspect bindings, prototype, export. Mark each "typical; verify in session", because
   MCP servers differ by version and by what the user has enabled.
3. **Read the system.** How to get tokens, styles, and components, quoting names exactly as the source
   has them (`design-system.md`).
4. **Write.** How to build frames or screens from real parts: bound tokens, real component instances,
   semantic type styles. When a part is missing, flag it to `SYSTEM-BACKLOG` and use the closest one.
5. **Audit.** The rendered-output audit, run after each batch and before the next. Check every frame, not
   a sample, and verify bindings rather than looks: a screenshot can match while the layer holds a raw
   value. Cover text clipping and overflow, color and spacing binding, instance integrity (a real
   instance, not a detached lookalike), type-style binding, real icons, and column alignment. Report in
   one table (Frame | Issue type | Detail | Severity, scale in `compliance.md`) and fix before the next
   batch. After two failed attempts at a finding, log a blocking gap to `SYSTEM-BACKLOG` and note it in
   the artifact; do not ship a fabricated substitute silently.
6. **Export & handoff.** What can leave the tool (images, SVG, code, tokens) and how it feeds
   `pd-handoff`.
7. **Known quirks.** Behavior that has surprised people. Label each as observed or reported, with the
   date or version if known, and expect it to age.

## Fallback ladder

Work down until something fits. State on the artifact which rung you used.

1. **Connected MCP or API for the tool.** Use the adapter in full.
2. **Files in the repo** (tokens JSON, CSS variables, SVG exports, a code design system): read them
   directly, and use `code.md` for rendering checks.
3. **No connection.** Ask the user to export: screenshots of the frames, SVG, a tokens JSON, and
   inspect-panel values for the elements in question. Work from those with `manual.md`, and say plainly
   which checks you could not perform (binding verification and instance integrity are the usual ones,
   since an image carries no bindings).

Never claim a check passed that the available inputs cannot support.

## Index

| Adapter | Tool | Use when `design_tool` is |
|---------|------|---------------------------|
| `figma.md` | Figma (and FigJam) via MCP | `figma` |
| `penpot.md` | Penpot, open source | `penpot` |
| `pencil.md` | Pencil (`.pen` files) via MCP | `pencil` |
| `sketch.md` | Sketch (macOS) | `sketch` |
| `framer.md` | Framer sites and prototypes | `framer` |
| `code.md` | Tokens and components in code, Storybook | `code-only`, or `design_system.source: code` |
| `manual.md` | No tool connected; screenshots and exports | `none`, or no connection |
| `diagrams.md` | Flows, architecture, journeys | any, for diagram artifacts |

To support a new tool, copy `_template.md`, fill every section, and add a row here.
