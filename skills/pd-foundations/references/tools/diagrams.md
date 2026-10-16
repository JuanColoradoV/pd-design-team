# Diagrams adapter

For flows, architecture, journeys, and state maps (`pd-ux-flows`, `pd-ux-architecture`). Diagrams are
text-first artifacts; the tool matters less than keeping the source reviewable.

## Detect

- Default: always available, since Mermaid is plain text.
- Brief or repo: FigJam, Miro, Whimsical, or Excalidraw links or `.excalidraw` files.
- MCP: tools for those products, if the session's tool list has them; never assume.

## Capabilities

Typical; verify in session. Mermaid: write (text) and export via renderers. Board tools: read and write
only when an MCP is connected; otherwise the user exports.

## Read the system

Reuse names from the product (screens, objects, states) exactly as the requirements and design files use
them, so the diagram and the design agree.

## Write

- Default to Mermaid in a fenced code block in the artifact: `flowchart` for flows, `stateDiagram-v2` for
  state logic, `journey` for journeys, `sequenceDiagram` for system interactions. It renders on GitHub
  and in most Markdown viewers and diffs cleanly.
- If a board tool is connected, build the diagram there and link it from the artifact, keeping the
  Mermaid source alongside so the content survives tool changes.
- Label every decision branch and every end state, including errors. Keep one diagram to one idea.

## Audit

Check that every node is reachable, every decision has all branches, error and empty paths exist, and
labels match product terms. If you cannot render the diagram, say so; read the source for syntax errors.

## Export & handoff

Mermaid source plus a rendered image if a renderer is available. Link board diagrams from the artifact.

## Known quirks

Mermaid layout is automatic; very wide diagrams become unreadable, so split them.
