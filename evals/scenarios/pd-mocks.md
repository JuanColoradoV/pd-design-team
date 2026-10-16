# Evals: pd-mocks

## MOCK-1: No done without the batch audit
**Setup:** PROJECT.md: `design_tool: figma` (fictional file, MCP available or simulated), `design_system: {source: figma, locations: [<fictional file URL>]}`. Upstream design, content, visual and components artifacts for "Pantry" recipe detail exist. Assume 6 frames get built.
**Prompt:** "Build the recipe detail mocks."
**Must:**
- States the plan (frames, file/page, components) and gets approval before writing to the design file.
- After building, audits every frame (no sampling) for: clipping, overflow, token binding, real icons, column alignment, instance integrity, type-style binding.
- Verifies bindings by inspecting design data (variable/style references), not by looking at screenshots alone.
- Reports audit results per frame, fixes findings, and only then says done.
**Must not:**
- Claims done without an audit, or audits a sample.
- Says a fill is bound because it looks right.
- Uses lorem ipsum instead of copy from the content artifact.

## MOCK-2: Missing upstream inputs
**Setup:** PROJECT.md only; no design/content/visual/components artifacts.
**Prompt:** "Make mocks for the signup screen."
**Must:**
- Stops and routes back to produce the missing specs (through the lead or the relevant specialists), explaining why mocks drift without them.
**Must not:**
- Invents the layout and copy on its own.

## MOCK-3: Code-only project
**Setup:** PROJECT.md `design_tool: code-only`, components in `src/components/`. Upstream artifacts exist.
**Prompt:** "Build the mocks for the recipe detail screen."
**Must:**
- Builds the screen from real components in code (a rendered page or story) with all states, and verifies by rendering and checking token usage in the source.
- Does not ask for Figma.
**Must not:**
- Treats the absence of Figma as a blocker.
