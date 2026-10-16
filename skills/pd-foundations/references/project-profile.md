# Project profile — `docs/design/PROJECT.md`

The profile is the one place a project tells the team what it is working with. Skills stay generic; the
profile makes them specific. Keep it short, factual, and current — it is read at the start of every task.

## Fields

| Field | What it holds | Who uses it |
|-------|---------------|-------------|
| `product` | One-line description of the product or feature area | everyone |
| `users` | Primary user groups, one line each | research, design, writing |
| `platforms` | web, iOS, Android, desktop, … | design, responsive, handoff |
| `design_system` | A mapping: `source` (`figma` · `penpot` · `pencil` · `sketch` · `framer` · `code` · `none`) and `locations` (design-file URLs or paths, or code paths) | design-system, visual, mocks, handoff |
| `conventions` | Top-level mapping of discovered naming: `type_roles`, `tokens`, `component_props` | design-system, visual, mocks |
| `design_tool` | `figma` · `penpot` · `pencil` · `sketch` · `framer` · `code-only` · `none` | mocks, prototyping |
| `requirements` | A mapping: `tracker` (`linear` · `jira` · `github` · `brief-only`) and `reference` (how an item is cited) | lead, research, qa, handoff |
| `analytics` | `amplitude` · `mixpanel` · `posthog` · `ga4` · `none` | metrics |
| `domain_packs` | e.g. `[healthcare]` — files in `references/domains/` | everyone |
| `compliance` | A mapping: `accessibility` (default WCAG 2.2 AA) and `regulatory` (list of active regimes) | qa, everyone |
| `artifacts_dir` | Where `INDEX.md`, `LEARNINGS.md`, artifacts, and `design-system/` live. Default `docs/design/`. The profile itself stays at `docs/design/PROJECT.md` unless the repo already has one elsewhere | everyone |
| `locale` | Product language(s) and regions | writing, visual, responsive |
| `capabilities` | A mapping of the last session check: `checked`, `connected`, `model`, `fallbacks` | lead, everyone |

The template, `templates/PROJECT.md`, is canonical for the shape: nested keys such as
`design_system.source` and `compliance.accessibility` are written exactly as it shows them.

## Creating it

`pd-design-lead` creates the profile at the start of the first effort on a project:

1. Infer what you can — look for a design-tokens file, a component library, Storybook, Figma links in the
   repo or brief, and which tracker/analytics tools are actually connected in this session.
2. Ask the user only for what you couldn't infer, in one short batch of questions.
3. Write the profile, show it, and get a quick confirmation.

## When it's missing

A specialist invoked on its own doesn't block on the profile. It proceeds with these defaults and lists
them under **Assumptions** in its artifact so the user can correct them:

- `design_system.source: none` until one is found — if the repo has tokens or a component library, use
  those and say so
- `requirements.tracker: brief-only` — the user's message is the brief
- `analytics: none`
- `domain_packs: []`, `compliance.accessibility: WCAG 2.2 AA`, `compliance.regulatory: []`
- `artifacts_dir: docs/design/`, `locale:` the language of the user's request

## Capabilities

`capabilities` records the last session check (`adaptation.md`): which tool connections were live, what
the model could do (vision, parallel subagents, web search, rendering), and which fallbacks were used. It
is a starting point, not a guarantee — connections change, so re-check at the start of each effort.

## Keeping it current

- When a specialist discovers a convention (for example, that type styles are named `text/*` rather than
  `role/*`), it adds it under the top-level `conventions` so the next agent doesn't rediscover it.
- `pd-design-system-ops` updates `design_system` and `conventions` when the system changes. When
  `design_system.source` is `none`, it first establishes a provisional system (see `design-system.md`).
- Values that change often (exact colors, sizes, the component roster) don't belong here. Read them from
  the live system each time.
