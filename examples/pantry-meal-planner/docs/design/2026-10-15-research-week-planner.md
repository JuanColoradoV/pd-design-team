---
project: Pantry meal planner (fictional)
ref: "brief-only: 'Let people plan the week's dinners from recipes they've saved, and get a shopping list for the plan.'"
topic: week-planner
discipline: research
author: pd-ux-research
date: 2026-10-15
status: draft
upstream: []
downstream: [flows, design, metrics]
---

## Summary

This is a desk-research and assumptions artifact, not research results. No users were interviewed, no
data was analyzed, and no web search was run in this session, so there are zero Findings. Everything
below is an Assumption or a Hypothesis, labeled, plus a concrete research plan to run next. Downstream
designs built on this carry that risk.

## Assumptions

- A-0: PROJECT.md exists and was read; no prior research artifact exists.
- Labels used: **Assumption** (believed, untested), **Hypothesis** (to validate, with the test named). There are no **Findings**.
- No quotes, statistics, studies, or competitor claims appear here, on purpose. Market and competitor claims need a dated search cross-referenced across 2+ sources (sourcing rule); none was run, so any such claim would be an Assumption.

Learnings applied: none

## Research questions and the decision they inform

Decision: is "one dinner per day, list derived from the plan" the right v1, and what must the list do to be trusted at the store?

1. How do home cooks decide what to cook this week today, and when (day of week, time of day)?
2. What do they do with the ingredients: how is the shopping list made now, and where is it used?
3. What makes a derived list wrong or untrustworthy (duplicates, units, ingredients they already have)?

## Assumptions (untested beliefs the design currently relies on)

| ID | Assumption | Risk if wrong |
|----|------------|---------------|
| A-1 | Planning happens in one sitting, usually before shopping day, on a phone or laptop. | Quick-add during the week matters more than a planner screen. |
| A-2 | One dinner per day is enough for v1; multiple recipes per day (sides) are rare. | Slot model must hold a list, not a single recipe. |
| A-3 | Users plan from recipes already saved, rather than discovering new ones while planning. | The picker needs search of all recipes, not only saved. |
| A-4 | The shopping list is used in a store, one-handed, often with poor connectivity. | Offline and large targets become requirements. |
| A-5 | Users already have staples (salt, oil), so a derived list that includes them feels noisy. | Needs a "pantry staples" handling decision. |
| A-6 | Ingredient lines in saved recipes are often free text ("a handful of herbs") that cannot be summed. | Partial-list state is common, not an edge case. |
| A-7 | Some shoppers are not the planner (a household member opens the list only). | Sharing becomes core; currently out of scope. |

## Hypotheses (with the test that would settle them)

| ID | Hypothesis | Test |
|----|------------|------|
| H-1 | People will plan 3-5 dinners a week, not 7, and leave some days open on purpose. | Interviews plus a diary study; later, plan-size data if analytics are added |
| H-2 | Grouping the list by store section is preferred over grouping by recipe. | Card sort, then a task-based test of both layouts |
| H-3 | Showing which recipe an item is for reduces "what is this for?" doubt. | Usability test on the shopping list |
| H-4 | When the plan changes after shopping started, users want checked items kept. | Scenario test; observe expectations |

## Research plan (the next step; nothing here has been run)

- **Method 1: generative interviews**, 45 min, remote. Target 8-10 for one homogeneous segment (home cooks who cook dinner at least 4 nights a week), then reassess per segment; stop at thematic saturation, not a fixed number.
  Recruit: screen for cooking frequency and current planning method (paper, notes app, none). Include 2+ participants who use a screen reader or magnification, and 2+ who shop with someone else's list.
  Exclude: people who primarily use meal-kit services. Consent for recording, de-identified notes, delete recordings after synthesis.
  Guide (neutral prompts): "Walk me through the last time you decided what to cook this week." "What did you do next?" "Show me where the shopping list lives." Probe for disconfirming cases: weeks they did not plan.
- **Method 2: unmoderated concept test** of the three mock screens (week planner, picker, shopping list) after this effort's mocks exist, 5 participants per round, task-based. Tasks: plan three dinners; fix a wrong item; use the list "in the store" on a phone.
- **Method 3: card sort** (open) of 30 real ingredient names for H-2.
- **Analysis plan:** affinity clustering, triangulate across methods before promoting anything to Finding; record disconfirming evidence; report small samples as directional.
- **Secondary research (not done):** a dated search on how existing meal-planning products structure the week and the list. Needs 2+ independent sources; until then competitor behavior is unknown to this team.

## Proto-persona (labeled assumption, not evidence-based)

"Weeknight cook" (Assumption A-1..A-5): cooks dinner most weekdays, saves recipes opportunistically, shops once or twice a week. Do not treat as a persona until interviews confirm or kill it.

## Opportunities (hypothesis-level)

1. Turn saved recipes into a plan in few taps (supports H-1).
2. Make the derived list trustworthy by showing its source and what it could not parse (H-3, A-6).

## Confidence and open questions

Confidence in every statement above: low, untested. Biggest unknowns: A-2, A-5, A-6. Open:
who owns running the interviews (the user); whether Pantry has saved-recipe ingredient data in structured form (engineering, affects A-6).
