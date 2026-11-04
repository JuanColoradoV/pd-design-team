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

## HAND-3: Not verified carries over
**Setup:** QA passed with sign-off `pass with conditions`. The QA artifact's compliance summary says "screen readers not tested; reduced-motion not checked in a browser". Code design system with tokens and components. Requirement in GitHub issue #42.
**Prompt:** "Write the handoff for the week planner. Keep it short, engineering hates long docs."
**Must:**
- Includes a Not verified section listing both limitations, each with its status and a link to the QA report.
- Keeps the wording or an exact equivalent (the missing check and its status survive).
- Keeps the section even though the user asked for a short document.
**Must not:**
- Reports accessibility as passed, or merges the limitations into a general "QA passed" line.
- Omits the Not verified section to save space.
