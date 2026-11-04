---
name: pd-handoff
description: >-
  Use when finished, QA-passed designs need to become engineering-ready: developer handoff specs,
  redlines and measurements, states and interaction notes, asset export, design-token-to-code mapping,
  and component-to-code mapping (with the design tool's code-mapping feature where available). The design-to-build bridge.
  Links work back to its requirement in the tracker. Part of the pd-* design team.
metadata:
  team: product-design
  role: handoff
  version: "2.1.0"
---

# pd-handoff — the design-to-engineering bridge

## Overview

Translate an approved, QA-passed design into everything engineering needs to build it faithfully, with
no ambiguity. The spec speaks in real design-system token and component names mapped to code, not raw
values, because names survive a theme change and values do not.

## Before you start

- Load `pd-foundations`: `design-system.md`, `accessibility.md`, `compliance.md`, `integrations.md`,
  `handoff-protocol.md`, `project-profile.md`, and the adapter for the project's design tool (`tools/README.md`).
- Read `docs/design/PROJECT.md` (design system location, design tool, requirements tracker). If missing,
  proceed with defaults recorded as assumptions, or ask `pd-design-lead`.
- Read upstream `*-design-*.md`, `*-content-*.md`, `*-visual-*.md`, `*-components-*.md`, `*-mocks-*.md`,
  and `*-qa-*.md` (all required; if one is missing, route back through `pd-design-lead`), plus
  `*-responsive-*.md` and `*-prototype-*.md` (optional) when they exist.

## When to use

- A design is approved and QA-passed and goes to engineering.
- Devs need specs, measurements, assets, or token/component-to-code mapping.

**Not for:** designs that are not final or have not passed `pd-ux-qa`. Finish that first; handing off
unstable designs causes rework.

## What a handoff includes

| Part | Detail |
|------|--------|
| Per-screen/component spec | Layout, spacing, type roles, color/spacing/elevation/radius tokens by name, every state, interactions, validation rules, and stacking order for overlays, modals, toasts, tooltips. State values in the target platform's native unit (px/rem web, pt iOS, dp Android) and say which applies where |
| Accessibility | Focus order, accessible names/roles, keyboard behavior, target sizes, reduced motion |
| Responsive behavior | Breakpoints and adaptive behavior. Without `*-responsive-*.md`, still state the supported breakpoint(s) and viewport range (even "single fixed breakpoint, desktop >=1280px"); state responsive scope explicitly |
| Assets | Icons/images at required densities (@1x/@2x/@3x mobile, SVG for web) in the naming convention engineering expects (e.g. `icon-name_state@2x.png`, kebab-case), in the agreed folder. Export via the design tool's adapter |
| Token mapping | Design token name to code token name |
| Component mapping | Design component to code component; use Figma Code Connect where the project uses Figma and it is available, otherwise a mapping table |

## Process

1. Confirm readiness: design approved and `pd-ux-qa` passed — no open Critical or High findings (or the
   user explicitly accepted them); Medium and Low may ship as tracked follow-ups. If not, stop.
2. Pull the requirement from the tracker via `ref:` (`integrations.md`); the spec must satisfy its
   acceptance criteria.
3. Write the spec with real names. Use a raw value only where no token exists, and flag that as a gap.
4. Export assets through the project's design tool adapter.
5. Map to code and verify each mapping rather than guessing. Coverage must match every state and
   variant in the spec; a mapping covering only the default variant is incomplete. List any state with
   no code equivalent as an open question.
6. Annotate edge cases: empty, error, loading, permissions, and any requirements from active domain
   packs or compliance regimes.
7. Link back: attach or reference the handoff on the tracker item via `ref:`; list open questions.

## Output

`<artifacts_dir>/<date>-handoff-<topic>.md` with the artifact header (`ref:` the requirement) and a spec
**version number**. Contents: spec, asset list, token/component-to-code mappings, accessibility and
responsive notes, compliance acceptance status (scoped to what QA tested), a **Not verified** section,
open questions.

The **Not verified** section is required, even when it says "none". It lists every check an upstream
specialist recorded as not run, not tested, or unverified (for example "screen readers not tested"),
each with its status, the artifact and section it came from, and a link to the QA report. Carry the
status and the missing check over unchanged; quote the specialist's wording where you can. Never
upgrade an untested scope to `passed` or fold it into a general "accessibility passed" line: a
limitation is only useful if the person deciding to ship still sees it. If the spec
changes after engineering has started, write a new dated handoff file with the spec version bumped
and what changed listed, and mark the old one `superseded`: silent edits break the build in flight. A
draft that engineering hasn't seen may be edited in place. `upstream:` design, content, visual,
components, mocks, qa (and responsive, prototype, if used). `downstream:` `engineering`.

Do not invent code token names, component names, or mappings; verify them, and flag where design and
current code diverge.

## Domain packs

If `PROJECT.md` lists domain packs, read each pack's section for handoff and apply it on top of this
skill.

## Common mistakes

- Raw values instead of token names.
- Missing states, accessibility, or responsive behavior in the spec.
- Assets not exported; code mappings guessed.
- Handing off before QA passes, or with no `ref:` link to the requirement.
- Editing a spec in place after build started, with no version bump.
- Summarizing an untested check as passed, or dropping it, instead of listing it under Not verified.
