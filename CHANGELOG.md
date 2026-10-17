# Changelog

## Unreleased

- **Worked example.** `examples/pantry-meal-planner/`: a full effort produced by running the team on a
  fictional app, including a coded hi-fi mock built only from tokens and an honest QA report.
- **Fixes found by running the example:** `plan` added as an artifact discipline; QA sign-off states
  defined (`pass` / `pass with conditions` / `fail`) and the handoff gate tied to them; the design-system
  backlog entry now follows the template; the code adapter states its audit table format.
- **README visuals** ("Design with receipts"): hero and social preview, team route, every-state, and worked
  example images, plus a new plugin icon. Every number on them comes from the example's artifacts. Sources and
  `render.sh` live in `.github/assets/src/`.
- **Demo GIF:** a real, labeled session of `pd-design-lead` planning a feature (`.github/assets/demo.gif`).
- **Community files:** code of conduct, security policy, accessibility statement, issue templates (skill
  behavior, tool adapter, eval result, accessibility barrier), and a pull request template.

## 2.0.0 — 2026-10-15

First public release.

- **Tool-agnostic.** Design-tool adapters for Figma, Pencil, Penpot, Sketch, Framer, code-based systems,
  and a no-tool fallback, all following one contract. Trackers and analytics are capabilities, not
  hard-wired products.
- **Project profile.** `docs/design/PROJECT.md` declares each project's system, tools, domain packs,
  compliance targets, and locale; skills stay generic.
- **Evaluate and adapt.** Session check of connected tools and model capabilities before planning;
  retro at close that writes project learnings to `LEARNINGS.md`.
- **Domain packs.** Domain rules moved out of the specialists into packs with per-discipline sections;
  regulatory audits run only when a project declares them.
- **Written for current models.** Calmer phrasing, reasons over shouting, leaner skills with detail in
  references.
- **Accessibility fixes.** Corrected the large-text threshold (14 pt bold ≈ 18.66 px), added missing
  WCAG 2.2 criteria with their levels, fixed Dragging Movements (a single-pointer alternative, not
  keyboard), the 2.5.8 spacing test, and 2.4.11 vs 2.4.12; conformance language now reports the checks
  performed instead of claiming conformance from a partial review.
- **Cross-file contract.** One PROJECT.md shape (nested `design_system`, `requirements`, `compliance`,
  top-level `conventions`), `<artifacts_dir>`-relative paths, `*-<discipline>-*.md` lookups, required /
  optional / replaceable input rules, a provisional-system step for empty projects, separate severity
  and blocking on backlog entries, and approved artifacts superseded rather than edited.
- **Eval suite.** Behavioral scenarios for all 16 skills plus cross-cutting adaptation scenarios.
- **Tooling.** `validate.py`, `install.sh` (symlinks into Claude Code, Codex, Gemini / Antigravity, or
  any directory), `package.sh`, CI workflow, Claude Code plugin manifest.
