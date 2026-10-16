---
project: Pantry meal planner (fictional)
ref: "brief-only: 'Let people plan the week's dinners from recipes they've saved, and get a shopping list for the plan.'"
topic: week-planner
discipline: content
author: pd-ux-writing
date: 2026-10-15
status: in-review
upstream: [2026-10-15-design-week-planner.md, 2026-10-15-flows-week-planner.md]
downstream: [visual, mocks, qa, handoff]
---

## Summary

Full copy for the three screens and every state in the design artifact, in English (`locale: [en]`).
Voice: warm, brief, kitchen-plain. Errors are calm and say what to do. No jokes in error or
destructive moments. Sample recipe names are invented for this fictional product.

## Assumptions

- Locale `en` only; strings are written to survive translation anyway (no concatenated fragments, plural-ready).
- Week starts Monday. Dates shown as "Oct 19 – 25, 2026" (en-US-style short month).
- Fictional sample data only; no real people, brands, or recipes from real publications.

Learnings applied: none

## Voice and tone

Voice: **friendly, direct, practical**. Do: "Add dinner", "Couldn't load your plan". Don't: "Oops!", "Submit", blame ("You entered..."). Tone flexes: errors calm and specific; success brief; empty states encouraging with one clear next step.

## String inventory: Screen 1 (Week planner)

| Where / state | String | Chars |
|---------------|--------|-------|
| h1 | This week | 9 |
| Week range | Oct 19 – 25, 2026 | 17 |
| Prev / next buttons | Previous week · Next week | 13 / 9 |
| Tabs | Plan · Shopping list | 4 / 13 |
| Day heading | Monday 19 … Sunday 25 | 9-12 |
| Open slot text | Nothing planned | 15 |
| Open slot button | Add dinner | 10 |
| Recipe caption | 4 servings · 35 min | 15-22 |
| Slot buttons | Change · Remove (aria-label: "Change Monday's dinner", "Remove Monday's dinner") | 6-7 |
| Past day | Past | 4 |
| Primary action | View shopping list | 18 |
| Loading | Loading your week | 17 |
| Empty heading / body / button | No dinners planned yet / Pick a few saved recipes and Pantry will turn them into a shopping list. / Browse saved recipes | 23 / 74 / 20 |
| Error heading / body / button | Couldn't load your plan / Something went wrong on our side. Your saved recipes are safe. / Try again | 24 / 61 / 9 |
| Offline notice | You're offline. Changes are saved on this device and sync when you're back online. | 80 |
| After remove | Removed Monday's dinner. · Undo | 24 / 4 |
| Deleted recipe | This recipe is no longer saved. · Choose another | 32 / 14 |

## String inventory: Screen 2 (Picker)

| Where / state | String |
|---------------|--------|
| h1 | Add dinner for Wednesday |
| Back | Back to week |
| Search label (visible) | Search saved recipes |
| Result count (live region) | 6 recipes |
| Recipe action | Choose (aria-label: "Choose Black bean tacos for Wednesday") |
| Already in week | Also on Thursday |
| Replace banner | Wednesday already has Mushroom stroganoff. Choosing another recipe replaces it. |
| Replace actions | Replace · Keep current |
| No saved heading / body / button | No saved recipes yet / Save a recipe you like, then come back to plan with it. / Find recipes |
| No results heading / body / button | Nothing matches "{query}" / Check the spelling or try a shorter word. / Clear search |
| Load error | Couldn't load your recipes / Your search is kept. Try again in a moment. / Try again |
| Save error | Couldn't save Wednesday's dinner. Your choice is kept. · Try again |

## String inventory: Screen 3 (Shopping list)

| Where / state | String |
|---------------|--------|
| h1 | Shopping list |
| Summary | 15 items for 5 dinners · 3 checked |
| Group headings | Produce · Dairy and eggs · Pantry · Meat and fish |
| Item context | For Mon, Thu |
| Plan changed | Amount changed |
| Partial heading | 2 ingredients couldn't be added |
| Partial body | Pantry couldn't read these lines. Check them in the recipe. |
| Partial items | Miso salmon bowls: "a handful of herbs", "soy to taste" |
| Empty | Nothing to shop for yet / Plan a few dinners and your list shows up here. / Plan dinners |
| Load error | Couldn't build your list / Something went wrong on our side. Try again. / Try again |
| All done | All 15 items checked |
| Clear | Clear checked items → "Cleared 3 items." · Undo |
| Offline | You're offline. Checks are saved on this device. |

## Copy checks

- Buttons are verb + object ("Add dinner", "Clear checked items"); no "Submit" or "OK". "Try again", "Choose", "Change", "Remove" are short because the context object is in the accessible name.
- Glossary: **dinner** (not "meal"/"entry"), **plan** (the week), **shopping list** (not "grocery list"), **saved recipe**. One concept, one word.
- Reading level: error and empty-state sentences are short; estimated Flesch-Kincaid grade about 3-5 by inspection (not computed with a tool).
- i18n notes for translators: "{query}" is a variable, keep quotes around it. "Choose" means select a recipe, not a preference. Plurals needed: "{n} recipes", "{n} items for {m} dinners", "Cleared {n} items". Expect German strings 30-100% longer: button labels must wrap or the button grow, never truncate.
- Honesty: "sync when you're back online" is only true if engineering builds offline sync; flagged below.

## Open questions

- Does engineering support offline writes and sync? If not, delete the offline strings and the offline state.
- Is "Pantry couldn't read these lines" acceptable to say about recipe authors' text, or should it be softer? Needs product voice review.

## Flagged gaps

None in the design system. Copy depends on gap substitutions only for the Alert pattern (see backlog).
