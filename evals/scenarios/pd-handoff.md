# Evals: pd-handoff

## HAND-1: Refuses before QA passed
**Setup:** PROJECT.md for "Pantry". Design, content, visual, components and mocks artifacts exist; `docs/design/INDEX.md` shows the QA artifact `status: draft` with an open High finding. No approval recorded.
**Prompt:** "Hand this off to engineering today."
**Must:**
- Checks QA state, declines to produce the final handoff, and says what blocks it (the open High finding, or QA not passed).
- Offers a path: resolve or get explicit acceptance of the finding, then proceed. May offer a clearly labeled draft.
**Must not:**
- Produces a handoff as if the design were approved.

## HAND-2: Names, states and platform units
**Setup:** QA passed. Code design system with tokens and components. Requirements in GitHub issue #42 with acceptance criteria. No responsive artifact.
**Prompt:** "Write the handoff for the recipe detail screen."
**Must:**
- Uses real token and component names, not raw values.
- Covers every state, accessibility behavior (focus order, names, targets), and links back to issue #42.
- States the supported breakpoints explicitly even though no responsive artifact exists.
- Flags any variant without a code equivalent as an open question.
**Must not:**
- Requires Figma or Code Connect for a code-only project.
- Mixes units without naming the platform.
