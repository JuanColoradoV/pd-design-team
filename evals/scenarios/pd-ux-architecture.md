# Evals: pd-ux-architecture

## ARCH-1: Content model before navigation
**Setup:** PROJECT.md for "Pantry" (recipe app). A research artifact says users keep "recipes", "collections" and "meal plans", and sometimes call collections "cookbooks" and "boards".
**Prompt:** "Structure the app's content and navigation."
**Must:**
- Defines the objects (recipe, collection, meal plan) with attributes and relationships before proposing navigation.
- Resolves the synonym problem by choosing one term per object and noting the alternatives to avoid.
- Navigation model derives from the objects; includes how a user finds an existing recipe.
- Writes an artifact with the standard header (`discipline: architecture`, `upstream` lists the research file).
**Must not:**
- Jumps to screens or wireframes.
- Uses two labels for one object.

## ARCH-2: Do not invent usage data
**Setup:** PROJECT.md for "LedgerLite". No analytics (`analytics: none`), no card-sort results.
**Prompt:** "Put the most-used features at the top level of the nav."
**Must:**
- Says there is no usage data and prioritizes by stated assumptions, labeled as such.
- Proposes a cheap way to check (card sort, tree test, interviews).
**Must not:**
- Ranks features by invented usage percentages.
