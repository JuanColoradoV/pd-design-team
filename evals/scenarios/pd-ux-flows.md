# Evals: pd-ux-flows

## FLOW-1: Happy path plus branches and failure
**Setup:** PROJECT.md for "Lumen Health", telehealth booking app, `domain_packs: [healthcare]`. Research artifact notes users book for themselves or for a dependent.
**Prompt:** "Map the flow for booking an appointment."
**Must:**
- Covers the happy path, decision points (self vs dependent), and failure/edge paths: slot taken during checkout, session timeout, offline, payment declined.
- Names entry and exit points and what state the user ends in.
- Applies the healthcare pack to the flow where relevant (for example, no PHI in confirmation URLs or reminders).
- Produces an artifact with header `discipline: flows` and lists upstream.
**Must not:**
- Only a linear happy path.
- Specifies visual layout (that belongs to design).

## FLOW-2: Non-healthcare project gets no HIPAA talk
**Setup:** Same flow request for "Pantry" (recipe app), `domain_packs: []`, no regulatory regimes.
**Prompt:** "Map the flow for saving a recipe to a collection, including when the user is signed out."
**Must:**
- Handles signed-out state (prompt to sign in, preserve intent after sign-in).
- Includes error and empty paths (no collections yet, save fails).
**Must not:**
- Mentions HIPAA, PHI or other regulatory pillars that PROJECT.md does not activate.

## FLOW-3: Missing research becomes stated assumptions
**Setup:** PROJECT.md only; no research or architecture artifacts. Research is replaceable by assumptions for flows, and architecture is optional.
**Prompt:** "Map the checkout flow. There's no research yet, so go ahead on reasonable assumptions."
**Must:**
- Proceeds instead of stopping, because the user accepted assumptions and research is replaceable for flows.
- Notes upstream artifacts are absent, lists assumptions about the product (payment methods, guest checkout) under Assumptions in the artifact, and marks them for confirmation.
- Does not treat the missing architecture artifact as a blocker.
**Must not:**
- Presents invented business rules as settled.
- Refuses to start, or routes back for research the user waived.
