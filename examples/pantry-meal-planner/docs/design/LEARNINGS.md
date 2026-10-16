# Learnings — Pantry (fictional)

<!-- What this project has taught the team. Every specialist reads the entries tagged with its
     discipline before starting. Rules: pd-foundations/references/adaptation.md.
     Never delete an entry — set status to retired and say why. -->

## L-001 — Audit token binding with computed styles, not only grep

- **Applies to:** mocks, visual, qa
- **What happened:** grep for raw hex, px and rgb found nothing, yet a computed-style check across 226 elements found two off-token colors: the skip link and the checkbox inputs fell back to browser defaults (default link blue, default black). Both looked fine and passed contrast.
- **Root cause:** colors that are never written in the source (UA defaults) cannot be found by searching the source.
- **Rule for next time:** after grep, resolve each element's computed color, background and border colors and compare against the resolved `--color-*` token set; set `color` explicitly on links and form controls.
- **Evidence:** mocks artifact, batch audit table (first run 2 off-token, re-run 0).
- **Added:** 2026-10-15 · **Status:** active

## L-002 — A static mock needs one labeled frame per interaction step

- **Applies to:** mocks, design, qa
- **What happened:** the picker mock showed a primary "Replace" next to "Keep current" on a recipe row to demonstrate the replace case, which contradicted the design's two-step flow (QA F-2). Separately, six specified states were never rendered (F-1), so QA could not audit them.
- **Root cause:** one page tried to show a multi-step state, and "all states" was satisfied in the spec but not in the build.
- **Rule for next time:** render each interaction step and each specified state as its own labeled section, or list the unrendered ones in the mocks artifact's "not built" line and have QA mark them untested; never fold two steps into one frame.
- **Evidence:** QA artifact F-1, F-2.
- **Added:** 2026-10-15 · **Status:** active

## Proposed upstream fixes (not applied; `skills/` untouched)

- `handoff-protocol.md` has no `discipline` value for the lead's plan, yet the brief asks for a plan file with the standard header; this example used `discipline: plan`. Add `plan` or say plans are headerless.
- `pd-design-lead` says "wait for the user's agreement", `compliance.md` allows Medium findings to ship as tracked follow-ups, and `pd-handoff` requires QA "passed": define whether "pass with conditions" satisfies the handoff gate.
- `pd-design-system` prescribes a backlog line format (`date · artifact · element · …`) that differs from `templates/SYSTEM-BACKLOG.md`; one should win.
- `tools/code.md` says to report in "the same table format as `tools/figma.md`", a cross-file dependency that is easy to miss; inline the format.
- `pd-ux-research` requires dated web search for market claims but says nothing about the case where search is available but the scope is a worked example; state that omitting market claims is the acceptable choice.
