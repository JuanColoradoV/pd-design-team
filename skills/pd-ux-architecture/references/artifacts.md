# Architecture artifacts and methods

## Content model (OOUX)
Objects/entities, their attributes, relationships (1:N, N:M), and the actions (verbs) each object
supports. Nouns first, verbs second.

## Taxonomy and controlled vocabulary
Start with LATCH as a lens (Location, Alphabet, Time, Category, Hierarchy). A controlled vocabulary gives
each concept a preferred term, its variant/synonym terms (aliased to the preferred one), and where useful
broader/narrower/related relationships, so one concept carries one label everywhere.

## Search model (when the product has search)
What is indexed, ranking/relevance signals, synonym and query-expansion rules, zero-results fallback.
Distinct from the search flow (`pd-ux-flows`) and the results screen (`pd-ux-design`).

## Sitemap
Canonical hierarchy: global areas, parent/child nodes, depth. Balance breadth against depth; mark public
vs. authenticated zones. One row per node: `name`, `path/slug`, `parent`, `depth`, `access`
(public/authenticated/role), `status` (live/planned/deprecated).

## Navigation model
Primary, secondary, and contextual navigation plus wayfinding. Per nav item: `label`, `destination`,
`placement`, `icon` (if any), `visibility rule` (role/permission), `active-state rule`. Wayfinding rules:
breadcrumbs, canonical path when a node has more than one parent, escape routes. Design for deep links:
users arrive mid-tree via search, bookmarks, and notifications.

## Inventory vs. audit
The inventory is a literal list of every entity/content item (type, owner, location, last updated). The
audit then judges each for accuracy, redundancy, and keep/merge/retire, resolving duplicate names first.

## Validation
- **Open card sort:** users group items and name their own categories. Use it to discover a taxonomy when
  none exists.
- **Closed card sort:** users sort items into your proposed categories. Use it to test an existing
  classification.
- **Tree testing:** run before freezing a sitemap deeper than about 3 levels.
- **Growth stress test:** would adding about 3 more entities or modules break primary navigation? If yes,
  the structure is fragile.

## Concepts
- **Information scent:** every label telegraphs what is behind it. Vague intermediate labels ("Resources",
  "Tools", "Management") force a guess.
- **Polyhierarchy:** one item classified under more than one parent in the same hierarchy (a product under
  both "Electronics" and "Gifts"). Different from cross-linking, which is a navigation concern.
- **Three orientation questions**, answerable at any depth in under a second: Where am I? What is here?
  Where can I go?
