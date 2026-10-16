# Changelog

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
