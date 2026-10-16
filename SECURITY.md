# Security policy

pd-design-team is mostly text that AI agents read and follow, plus small shell and Python scripts. The
risks worth reporting are:

- **Instructions that could make an agent act unsafely** — a skill that could lead an agent to leak data,
  run destructive commands, or follow instructions planted in files it reads.
- **Script vulnerabilities** in `scripts/install.sh`, `scripts/package.sh`, or `scripts/validate.py` —
  for example, deleting or overwriting files the script doesn't own.
- **Leaked private data** — anything that looks like a real person's or company's information.

## Reporting

Please report privately through [GitHub's private vulnerability reporting](../../security/advisories/new)
rather than opening a public issue. Include the file, what could happen, and how to reproduce it. You
should get an acknowledgment within a week. Fixes ship in a new release noted in `CHANGELOG.md`.

## Supported versions

Only the latest release is supported.
