# Contributing

Thanks for helping. A few rules keep the team portable and trustworthy.

## Keep skills generic

Skills describe how a design team works, not any particular product. Private project identities and
proprietary values — client or employer names, real file links, token values, font stacks — belong in a
project's `PROJECT.md`, never in this repo. Author attribution, public sources (W3C, published methods),
tool vendors, and synthetic examples are fine. The
validator rejects real Figma file URLs; maintainers can add a private `.denylist` (gitignored, one regex
per line) for names that must never be published.

## Write for capable models

- Calm, direct imperatives. Give the reason for a rule in a clause — models generalize from reasons.
- No all-caps emphasis; it makes current models over-apply rules. The validator warns about it.
- Spend words on the team's contract and its failure modes, not on things any model already knows.
- Keep `SKILL.md` at or under 110 lines (the validator warns above that); move long checklists into the
  skill's `references/`.
- Descriptions start with "Use when…" (or "Use before/after…") and describe triggers, not the workflow.

## Tool-specific detail goes in adapters

A new design tool is one file in `skills/pd-foundations/references/tools/` (copy `_template.md`). A new
regulated domain is one file in `references/domains/` (copy `_template.md`). Specialist skills refer to
"the adapter for the project's design tool", never to one tool.

## Check your change

```bash
python3 scripts/validate.py          # frontmatter, references, leaks
```

Then run the eval scenarios for the skills you touched (see `evals/README.md`) on at least one model, and
add a scenario when you add or change a behavior. Note the change in `CHANGELOG.md`.
