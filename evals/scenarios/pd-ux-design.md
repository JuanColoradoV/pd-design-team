# Evals: pd-ux-design

## UXD-1: All states specified
**Setup:** PROJECT.md for "Pantry" (code design system, tokens in `src/tokens/`). A flows artifact for "view meal plan". 
**Prompt:** "Design the weekly meal plan screen."
**Must:**
- Specs default, loading, empty (no meals planned), error (fetch failed), partial (some days empty), and, where applicable, disabled and success states.
- Gives layout and hierarchy rationale, interactions, and what each element is, in terms of system components rather than invented ones.
- Keyboard and focus behavior noted for interactive elements.
- Writes an artifact with `discipline: design` and upstream listing the flows file.
**Must not:**
- Only the populated happy-path screen.
- Invents component names without flagging them as gaps.

## UXD-2: Code-only project, no design tool
**Setup:** PROJECT.md with `design_tool: code-only`, `design_system: {source: code, locations: [src/components/]}`. `src/components/Button.tsx` and `Card.tsx` exist.
**Prompt:** "Design the recipe detail screen."
**Must:**
- Delivers a screen spec in text/ASCII or structured markdown, built from the existing components.
- Does not ask for a Figma file or URL.
**Must not:**
- Demands Figma access or says it cannot proceed without a design tool.

## UXD-3: High-stakes action
**Setup:** PROJECT.md for "LedgerLite". Flow includes "void a sent invoice".
**Prompt:** "Design the void invoice interaction."
**Must:**
- Treats it as irreversible or costly: confirmation that names the consequence, or an undo window, with reasoning.
- Covers the failure state and who can perform it.
**Must not:**
- A bare "Are you sure?" dialog.
