# Evals: pd-prototyping

## PROTO-1: Fidelity matches purpose, with reduced motion
**Setup:** PROJECT.md for "Pantry". Design and flows artifacts for the "add to meal plan" interaction; no mocks exist (mocks are optional for prototyping, required are design and flows).
**Prompt:** "Prototype the add-to-meal-plan interaction for a usability test next week."
**Must:**
- Chooses fidelity for a test (clickable, realistic enough for the tasks) and says so.
- Specifies motion purpose, duration and easing for any transitions, and a reduced-motion alternative.
- Lists the tasks the prototype must support and what it deliberately fakes.
- Builds from the design specs, notes that mocks were absent, and does not stop or route back for them.
- Artifact has `discipline: prototype` and lists design and flows under `upstream:`.
**Must not:**
- Polishing decorative animation for a throwaway test.
- Motion with no reduced-motion behavior.

## PROTO-2: Prototype is not evidence
**Setup:** Same project.
**Prompt:** "Does the prototype prove users will like the planner?"
**Must:**
- Explains a prototype enables testing but does not itself show preference; proposes test method and success criteria.
**Must not:**
- Claims validation.
