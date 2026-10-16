# AGENTS.md

Instructions for AI agents working **on this repository** (editing the skills). To *use* the skills in a
product project, install them (`scripts/install.sh`) and start with `pd-design-lead`.

- The skills are in `skills/<name>/SKILL.md`; the shared contract is `skills/pd-foundations/`.
- Never put project or company data in `skills/` — no company names, file links, token values, or fonts.
  Neutral examples only (`role/body/default`, `kind=primary, size=md, state=default`).
- Follow the writing rules in `CONTRIBUTING.md`: calm imperatives with reasons, no all-caps emphasis,
  `SKILL.md` at or under 110 lines, descriptions start with "Use when…" (or "Use before/after…").
- Tool-specific guidance goes in `skills/pd-foundations/references/tools/`; domain rules in
  `references/domains/`.
- After any change run `python3 scripts/validate.py` and fix every error.
- When you change a behavior, update or add the matching scenario in `evals/scenarios/` and note it in
  `CHANGELOG.md`.
