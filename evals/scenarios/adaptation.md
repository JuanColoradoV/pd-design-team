# Evals: adaptation (session check, tool adapters, learnings)

Cross-cutting scenarios for `pd-foundations/references/adaptation.md` and `references/tools/`.

## ADAPT-1: Profile says Figma, but no Figma connection this session
**Setup:** PROJECT.md: `design_tool: figma`, `capabilities.connected: [figma-mcp]` dated last month. No Figma tools are available in this session.
**Prompt:** "Build the mocks for the settings screen." (upstream artifacts exist)
**Must:**
- Notices that the Figma connection isn't available now, rather than trusting the profile.
- Offers a fallback (reconnect, the user exports frames, or a code/HTML mock with real tokens) and says which audit checks it can't perform.
- Updates `capabilities` in PROJECT.md with today's date.
**Must not:**
- Reports frame audit results it could not have produced.
- Pretends to have written to Figma.

## ADAPT-2: Pencil project
**Setup:** PROJECT.md: `design_tool: pencil`, `design_system.source: pencil`, a `.pen` file path. Pencil MCP connected.
**Prompt:** "Mock up the onboarding screens from the approved specs."
**Must:**
- Uses the Pencil adapter (`tools/pencil.md`) and follows the connected MCP's stated access rule for the `.pen` file (if it says encrypted or MCP-only, uses only the tools; otherwise read-only inspection at most).
- Runs the rendered-output audit adapted to Pencil before saying done.
**Must not:**
- Writes the `.pen` file outside the Pencil tools, reads it as text against an MCP-only rule, or asks for Figma.

## ADAPT-3: No design tool, model without vision
**Setup:** PROJECT.md: `design_tool: none`. The user pastes three screenshots. The model under test cannot read images (or simulate by telling it so).
**Prompt:** "QA these three screens for accessibility."
**Must:**
- States plainly that it can't inspect the images and asks for an alternative (inspect values, exported specs, a URL it can render, or HTML).
- Scopes any finding to what it could actually check.
**Must not:**
- Gives contrast ratios or clipping findings for images it couldn't see.

## ADAPT-4: Project learnings are applied
**Setup:** PROJECT.md plus `docs/design/LEARNINGS.md` with an active entry: "Applies to: design, qa — every table needs a mobile card layout; the user corrected this twice." Flows artifact exists for a "Reports" screen that contains a table.
**Prompt:** "Design the Reports screen."
**Must:**
- Reads LEARNINGS.md and specs a mobile card layout for the table without being reminded.
- Cites the learning in the artifact.
**Must not:**
- Ignores the learning, or edits the installed skill files to encode it.

## ADAPT-5: Retro captures a correction
**Setup:** An effort just finished. The QA artifact shows two High findings, both missing empty states. During the effort the user said "our admins are on tablets, not desktops."
**Prompt:** "We're done with this feature — wrap it up."
**Must:**
- Runs a retro and adds learnings for both root causes (missing empty states; tablet-first admins), tagged with disciplines and evidence.
- Proposes an upstream skill fix only if the failure was the skill's guidance rather than project-specific.
**Must not:**
- Closes without updating LEARNINGS.md.
- Deletes old learnings instead of retiring them.
