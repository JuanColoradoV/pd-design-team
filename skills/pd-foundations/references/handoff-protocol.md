# Handoff protocol — how the team passes work

Specialists coordinate through structured markdown artifacts on disk. Any model or runtime can read and
write them, so the files are the team's message bus. That only works if every artifact is findable,
self-describing, and never silently rewritten.

## Workspace

The project profile always lives at `docs/design/PROJECT.md`, unless the repo already keeps one
elsewhere; in that case use that location and note it in the repo's agent instructions (for example
`AGENTS.md`) so every specialist finds it. Everything else (`INDEX.md`, `LEARNINGS.md`, artifacts, and
`design-system/`) lives under the `artifacts_dir` the profile declares (default `docs/design/`). Examples
in these files that show `docs/design/` mean that default; substitute the project's `artifacts_dir`.

```
<artifacts_dir>/                    # default docs/design/
  INDEX.md                          # owned by pd-design-lead: every artifact, stage, status
  LEARNINGS.md                      # what this project has taught the team (see adaptation.md)
  2026-03-02-research-onboarding.md
  2026-03-04-flows-onboarding.md
  2026-03-05-design-onboarding.md
  …
  design-system/
    SYSTEM-BACKLOG.md               # gaps flagged during product work
    CHANGELOG.md                    # changes shipped into the live system
```

`PROJECT.md` (the profile, see `project-profile.md`) sits at `docs/design/PROJECT.md` as described above.

## Naming

`<artifacts_dir>/<YYYY-MM-DD>-<discipline>-<topic>.md`

`discipline` is one of `research · architecture · flows · design · content · visual · components · mocks ·
qa · prototype · responsive · handoff · metrics`. Use the same `topic` slug across one effort so the
chain is easy to follow.

To find an artifact, match `<artifacts_dir>/*-<discipline>-*.md` (for example `*-design-*.md`). Resolve
the exact path through `INDEX.md` and the topic slug when an index exists: the row names the file and
its status, so you pick the right one when several match and skip superseded files.

## Header

Every artifact starts with this header (template: `templates/artifact.md`).

```markdown
---
project: <product / feature>
ref: <requirement ID or URL from the tracker, if any>
topic: <slug>
discipline: <one of the disciplines above>
author: <skill name, e.g. pd-ux-research>
date: <YYYY-MM-DD>
status: draft        # draft → in-review → approved → superseded
upstream: [<artifacts actually consumed — not ones that were skipped or replaced by assumptions>]
downstream: [<disciplines expected to consume it — names from the list above, or `engineering`>]
---

## Summary
<2–4 sentences: what this is and the key decisions, so the next specialist can orient fast.>

## Assumptions
<Defaults or guesses this artifact relies on — especially when PROJECT.md was missing or incomplete.>
```

## Pipeline — who reads what

`pd-design-lead` picks the subset and order; this is the full chain. Every specialist also reads the
brief or requirement and `PROJECT.md`; the columns list the artifacts. The file name pattern is
`*-<discipline>-*.md`, resolved as described under Naming.

| Skill | Required | Replaceable by assumptions | Optional | Writes |
|-------|----------|----------------------------|----------|--------|
| `pd-ux-research` | brief | | prior research | `*-research-*.md`: findings, personas, JTBD, opportunities |
| `pd-ux-architecture` | | research | | `*-architecture-*.md`: content model, taxonomy, sitemap, navigation |
| `pd-ux-flows` | | research | architecture | `*-flows-*.md`: user flows, task flows, journeys |
| `pd-ux-design` | | flows, research | architecture | `*-design-*.md`: layout, interaction, screen specs, states |
| `pd-ux-writing` | design | | flows | `*-content-*.md`: microcopy, errors, voice |
| `pd-visual-design` | design | | content | `*-visual-*.md`: type, color, spacing, hierarchy via tokens |
| `pd-design-system` | design, visual | | | `*-components-*.md`: exact components, variants, tokens |
| `pd-mocks` | design; for hi-fi also content, visual, components | | responsive | rendered mocks + `*-mocks-*.md` (links + audit) |
| `pd-ux-qa` | design, and the built UI or mocks | | every other upstream artifact that exists | `*-qa-*.md`: findings by severity |
| `pd-responsive` | design | | flows | `*-responsive-*.md`: breakpoints, adaptive specs |
| `pd-prototyping` | design, flows | | mocks | `*-prototype-*.md`: prototype link, interaction and motion specs |
| `pd-handoff` | design, content, visual, components, mocks, qa | | responsive, prototype | `*-handoff-*.md`: dev spec, token/component→code, assets |
| `pd-metrics` | design | research | | `*-metrics-*.md`: success metrics, instrumentation, results |

`pd-ux-writing` and `pd-visual-design` don't depend on each other and can run in parallel after design.
`pd-design-system` can start as soon as visual is done. `pd-mocks` at high fidelity is a join point: it needs all four of
its required inputs. A specialist lists every input it actually used under `upstream:`, optional ones
included, and the producing specialist names the readers under `downstream:`.

## Missing inputs

Each input is one of three kinds, shown in the pipeline table. What a specialist does when one is absent:

- **Required:** stop and route back through `pd-design-lead`, which schedules the missing stage. Inventing
  its content would pass guesses downstream as decisions.
- **Replaceable by stated assumptions:** proceed, and list the assumptions under **Assumptions** in your
  artifact so the user can correct them. Do this only when the user accepts that trade; ask once if
  unsure. Research standing in for flows or design is the usual case.
- **Optional:** proceed without it, and use it when it exists.

`PROJECT.md` is replaceable by the defaults in `project-profile.md`. A prototype can be built from design
specs, so mocks are optional for `pd-prototyping`; mocks themselves require design, content, visual, and
components.

## Status lifecycle

`draft` → `in-review` → `approved` → `superseded`

A `draft` or `in-review` artifact may be edited in place. An approved artifact is a decision other work
depends on, so it is never edited: write a new dated file, set the old one to `superseded`, and point
the links at the replacement. History stays readable.

## Rules for every specialist

1. Read `PROJECT.md`, the `LEARNINGS.md` entries for your discipline, and your declared inputs before
   starting. If one is missing, apply the rule for its kind under Missing inputs; never invent its
   content.
2. Write your declared output with the header above.
3. Report the new artifact to `pd-design-lead`, which is the only writer of `INDEX.md` (one writer avoids
   conflicting edits). When working alone with no lead, update `INDEX.md` yourself.
4. Link upstream decisions instead of restating them.

## Index

`INDEX.md` (template: `templates/INDEX.md`) has one row per artifact, added the moment it's created.

- The row's status mirrors the artifact header; update it whenever the header changes.
- Rows are never deleted. A superseded artifact keeps its row with `superseded → <new file>`.
- Group by feature once more than one is in flight.
- Side-loop artifacts (`SYSTEM-BACKLOG.md`, `CHANGELOG.md`, `*-metrics-*.md`) are indexed too.

## Design-system growth loop

The design system grows out of product work:

1. **Flag** — a specialist that needs a token, style, or component the system lacks appends an entry to
   `design-system/SYSTEM-BACKLOG.md` (template: `templates/SYSTEM-BACKLOG.md`): what was needed, where,
   why existing parts didn't fit, and two separate ratings: severity (Critical/High/Medium/Low, the scale
   in `compliance.md`) and whether it blocks the work (yes/no). When the gap doesn't block, it continues
   with the closest existing part and notes the substitution in its artifact; a blocking gap stops that
   element until triage.
2. **Triage and build** — `pd-design-system-ops` decides add / extend / reuse / reject and, for additions,
   updates the live system through the tool `PROJECT.md` declares (after confirming with the user).
3. **Record** — it logs the change in `design-system/CHANGELOG.md` (template: `templates/CHANGELOG.md`)
   and updates the top-level `conventions` in `PROJECT.md` if a naming pattern changed.
4. **Propagate** — artifacts that used a substitution move to the new part. Edit draft or in-review
   artifacts in place; for an approved one, write a new dated file that supersedes it (and, for a
   handoff spec, bump the spec version in the new file).
