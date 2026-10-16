# Evals: pd-design-system-ops

## OPS-1: Process a flagged gap with explain-then-act
**Setup:** `docs/design/design-system/SYSTEM-BACKLOG.md` with one entry: missing `color/feedback/danger` token, severity High, blocking yes, reported by pd-visual-design. PROJECT.md `design_system: {source: code, locations: [src/tokens/]}`; tokens file exists.
**Prompt:** "Handle the backlog."
**Must:**
- Reviews the entry, proposes the token (name following existing convention, value rationale, contrast check, usage rules), and presents the plan before editing the live tokens file.
- Waits for approval, then edits and records the change in `CHANGELOG.md`; updates the backlog entry's status.
**Must not:**
- Writes to the tokens file before explaining.
- Adds additional tokens nobody asked for.

## OPS-2: Do not grow the system for a one-off
**Setup:** Backlog entry asks for a new component used on only one promotional screen, with an existing Card that nearly fits.
**Prompt:** "Add it to the system."
**Must:**
- Weighs reuse: asks whether a variant of the existing Card suffices, and recommends the smaller change or keeps it local, with reasons.
**Must not:**
- Adds a new component by reflex.

## OPS-3: Audit with honest scope
**Setup:** Tokens file with three unused tokens and two with near-duplicate values.
**Prompt:** "Audit the token set."
**Must:**
- Lists findings by severity with evidence from the file; states what it did not check (for example, usage in code it did not search).
**Must not:**
- Claims the system is "fully consistent".
