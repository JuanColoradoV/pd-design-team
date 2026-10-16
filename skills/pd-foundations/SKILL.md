---
name: pd-foundations
description: >-
  Use when starting or contributing to any product-design task handled by a pd-* skill (research,
  architecture, flows, screens, copy, visual, design system, mocks, prototypes, QA, handoff, metrics).
  Holds the shared contract every specialist works against. Load it before any other pd-* skill.
metadata:
  team: product-design
  role: foundations
  version: "2.0.0"
---

# pd-foundations — the shared contract

## Overview

This skill does no design work. It is the contract that makes the specialists' work interlock: the same
standards, the same vocabulary, the same live design system, and the same handoff artifacts on disk.
Coordination happens through those files rather than a private agent-to-agent channel, so the team runs
the same way on any model or runtime that can read and write files.

## First, read the project profile

Every project declares its context in `docs/design/PROJECT.md`: product and users, where the live design
system lives (Figma, code, Penpot, or none yet), which requirements tracker and analytics source exist,
which domain packs apply, compliance targets, and locale. Read it before doing anything else — it decides
which references and tool adapters below are relevant. The profile stays at that path (unless the repo
already keeps one elsewhere); every other path in the contract (index, learnings, artifacts) is relative
to its `artifacts_dir`, default `docs/design/`.

If it doesn't exist, `pd-design-lead` creates it from `templates/PROJECT.md` with the user. A specialist
invoked alone proceeds with the defaults in `references/project-profile.md` and records them as
assumptions in its artifact.

Then read the entries for your discipline in `<artifacts_dir>/LEARNINGS.md` if it exists — what this project
has already taught the team — and check what this session can actually do (connected tools, vision,
subagents, web search). The profile says what the project uses; the session check says what you can reach
right now. See `references/adaptation.md`.

## References (load what the task needs)

| Reference | Load when |
|-----------|-----------|
| `references/working-agreement.md` | Always — explain-then-act and the honesty charter |
| `references/project-profile.md` | Reading, creating, or updating `PROJECT.md`; defaults when it's missing |
| `references/adaptation.md` | Start of every effort (session check) and its close (retro, learnings) |
| `references/handoff-protocol.md` | Producing or consuming any artifact — naming, header, pipeline, index, status, system-growth loop |
| `references/principles.md` | Any design decision |
| `references/accessibility.md` | Any UI, content, visual, or QA work |
| `references/compliance.md` | QA, or any work under an active regulatory pillar — also the shared severity scale |
| `references/design-system.md` | Any component, token, visual, or mock work |
| `references/integrations.md` | Pulling requirements or analytics |
| `references/tools/` | The project's design tool — pick the adapter named by `design_tool` in PROJECT.md (`tools/README.md`) |
| `references/domains/<pack>.md` | `PROJECT.md` lists that domain pack |

Templates for every file the team writes live in `templates/`.

## The contract

1. **Bind to the live system.** The project's design system is the source of truth and it evolves. Use
   its real type roles, tokens, and component variants; re-read it before system-dependent work. When
   something the design needs is missing, log a gap and use the closest real part with the substitution
   noted — an invented name looks plausible and silently breaks the build. See `design-system.md`.
2. **Accessibility is the floor.** Meet the project's target (default WCAG 2.2 AA) in every artifact, not
   just at QA. See `accessibility.md`.
3. **Work through artifacts.** Read your declared inputs, write your declared output with the standard
   header, keep `INDEX.md` current, and supersede approved artifacts instead of overwriting them. See
   `handoff-protocol.md`.
4. **Trace to requirements.** When a tracker exists, pull the real requirement and put its ID in the
   artifact's `ref:` field. Never invent IDs or acceptance criteria. See `integrations.md`.
5. **Apply domain packs.** When `PROJECT.md` lists one, apply its section for your discipline. Regulatory
   pillars (HIPAA, GDPR, …) are active only when the project declares them.
6. **Explain, then act.** State what you're about to change before writing artifacts or touching a live
   tool; confirm first for anything consequential or hard to reverse. See `working-agreement.md`.
7. **Be honest.** Label findings, assumptions, and hypotheses; never fabricate sources, quotes, data, or
   token names; caveat what may have changed since your training data.
8. **Verify before claiming done.** Anything rendered (frames, coded mocks) gets the audit in the matching
   tool adapter, and claims are scoped to what was actually checked.
9. **Adapt to what's real.** Plan around the tools and capabilities this session actually has, fall back
   openly when something is missing, and capture project lessons in `LEARNINGS.md` so the next effort
   starts smarter. See `adaptation.md`.

## How the team coordinates

```
pd-design-lead → scopes the request, confirms a plan, routes specialists, owns <artifacts_dir>/INDEX.md
     │
     ├─ each specialist: load pd-foundations → read PROJECT.md + input artifacts → work
     │                   → write output artifact → report it to the lead
     └─ default pipeline: research → architecture → flows → design → (writing ∥ visual → design-system)
                          → mocks → qa, with responsive, prototyping, handoff, and metrics as needed
                          and pd-design-system-ops as an always-on side loop
```

If your runtime can run subagents in parallel, independent stages (writing ∥ visual) can run
concurrently; otherwise run them in sequence. Results must not depend on parallelism.

## Common mistakes

- Skipping `PROJECT.md` and assuming a toolchain — demanding Figma in a code-only project, or applying
  HIPAA rules to a recipe app.
- Writing `#FF7A00` or "16px bold" where a real token or type role exists.
- Designing before reading the upstream artifact, so the work traces to nothing.
- Declaring done on the strength of a screenshot without the adapter's audit.
- Writing project data (token snapshots, file links) into skill files. Project data belongs in the
  project's `PROJECT.md` and `docs/design/`.
