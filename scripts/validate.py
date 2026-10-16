#!/usr/bin/env python3
"""Validate the pd-* skills: frontmatter, cross-references, and leaks.

Standard library only, so it runs anywhere (CI, any laptop, any agent sandbox).

    python3 scripts/validate.py            # errors fail, warnings print
    python3 scripts/validate.py --strict   # warnings fail too

Optional private denylist: put one regex per line in `.denylist` at the repo root (gitignored) to block
names that must never be published — client names, internal URLs, people.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SKILLS = ROOT / "skills"
FOUNDATIONS = SKILLS / "pd-foundations"

NAME_RE = re.compile(r"^[a-z0-9]+(-[a-z0-9]+)*$")
# Backticked file references such as `handoff-protocol.md` or `tools/figma.md`.
REF_RE = re.compile(r"`((?:[\w./-]+/)?[\w.-]+\.md)`")
# Names that are artifacts the team writes into a project, not files in this repo.
PROJECT_FILES = {"PROJECT.md", "INDEX.md", "SYSTEM-BACKLOG.md", "CHANGELOG.md", "SKILL.md", "README.md",
                 "AGENTS.md", "CLAUDE.md", "GEMINI.md"}
PROJECT_DIRS = ("design-system/", "docs/", "<artifacts_dir>/")
FIGMA_FILE_RE = re.compile(r"figma\.com/(?:design|file|proto)/[A-Za-z0-9]{10,}")
SHOUT_RE = re.compile(r"\b(MUST|NEVER|ALWAYS|MANDATORY|CRITICAL|IMPORTANT)\b")
MAX_SKILL_LINES = 110
MAX_DESCRIPTION = 1024

errors: list[str] = []
warnings: list[str] = []


def parse_frontmatter(text: str) -> dict[str, str] | None:
    """Minimal YAML subset: top-level `key: value` and folded `key: >-` blocks."""
    if not text.startswith("---\n"):
        return None
    m = re.search(r"\n---[ \t]*(\n|$)", text[3:])
    if not m:
        return None
    end = 3 + m.start()
    fields: dict[str, str] = {}
    key = None
    for line in text[4:end].splitlines():
        m = re.match(r"^([A-Za-z_][\w-]*):\s*(.*)$", line)
        if m:
            key, value = m.group(1), m.group(2).strip()
            fields[key] = "" if value in (">-", ">", "|", "|-") else value.strip("\"'")
        elif key and line.startswith("  "):
            nested = re.match(r"^\s+([\w-]+):\s*(.*)$", line)
            if key == "metadata" and nested:
                fields[f"metadata.{nested.group(1)}"] = nested.group(2).strip().strip("\"'")
            else:
                fields[key] = (fields[key] + " " + line.strip()).strip()
    return fields


def resolves(ref: str, skill_dir: Path, here: Path) -> bool:
    name = Path(ref).name
    if ref.startswith(("docs/", "*", "<")) or "*" in ref or "<" in ref:
        return True
    if name in PROJECT_FILES and (("/" not in ref) or ref.startswith(PROJECT_DIRS)):
        return True  # a file the team writes into a project, not a path into this repo
    if re.match(r"^\d{4}-\d{2}-\d{2}-", name):  # dated artifact example
        return True
    ref = ref.removeprefix("pd-foundations/")
    candidates = [here / ref, skill_dir / ref, skill_dir / "references" / ref,
                  FOUNDATIONS / ref, FOUNDATIONS / "references" / ref, FOUNDATIONS / "templates" / ref,
                  SKILLS / ref, ROOT / ref]
    return any(c.is_file() for c in candidates)


SKIP_DIRS = {".git", "dist", "__pycache__", "node_modules"}
SKIP_FILES = {".denylist"}


def distributable_files():
    for path in ROOT.rglob("*"):
        if path.is_file() and path.name not in SKIP_FILES and not SKIP_DIRS & set(path.relative_to(ROOT).parts):
            yield path


def load_denylist() -> list[re.Pattern[str]]:
    path = ROOT / ".denylist"
    if not path.is_file():
        return []
    return [re.compile(line.strip(), re.IGNORECASE) for line in path.read_text().splitlines()
            if line.strip() and not line.startswith("#")]


def main() -> int:
    strict = "--strict" in sys.argv
    denylist = load_denylist()
    skill_dirs = sorted(p for p in SKILLS.iterdir() if p.is_dir())
    if not skill_dirs:
        errors.append("no skills found under skills/")

    for skill_dir in skill_dirs:
        skill_md = skill_dir / "SKILL.md"
        rel = skill_md.relative_to(ROOT)
        if not skill_md.is_file():
            errors.append(f"{skill_dir.name}: missing SKILL.md")
            continue
        text = skill_md.read_text()
        fm = parse_frontmatter(text)
        if fm is None:
            errors.append(f"{rel}: missing or malformed frontmatter")
            continue
        name = fm.get("name", "")
        if name != skill_dir.name:
            errors.append(f"{rel}: name '{name}' does not match directory '{skill_dir.name}'")
        if not NAME_RE.match(name) or len(name) > 64:
            errors.append(f"{rel}: name must be lowercase-hyphenated, ≤64 chars")
        desc = fm.get("description", "")
        if not desc:
            errors.append(f"{rel}: missing description")
        elif len(desc) > MAX_DESCRIPTION:
            errors.append(f"{rel}: description is {len(desc)} chars (max {MAX_DESCRIPTION})")
        elif not desc.lower().startswith(("use when", "use before", "use after")):
            warnings.append(f"{rel}: description should start with 'Use when…' (trigger-first)")
        if not fm.get("metadata.version"):
            warnings.append(f"{rel}: no metadata.version")
        lines = text.count("\n")
        if lines > MAX_SKILL_LINES:
            warnings.append(f"{rel}: {lines} lines (keep SKILL.md at or under {MAX_SKILL_LINES}; move detail to references/)")
        body = re.split(r"\n---[ \t]*\n", text, maxsplit=1)[-1]
        for word in sorted(set(SHOUT_RE.findall(body))):
            warnings.append(f"{rel}: shouted '{word}' — modern models over-apply all-caps emphasis")

    for md in sorted(SKILLS.rglob("*.md")):
        rel = md.relative_to(ROOT)
        text = md.read_text()
        skill_dir = SKILLS / md.relative_to(SKILLS).parts[0]
        for ref in sorted(set(REF_RE.findall(text))):
            if not resolves(ref, skill_dir, md.parent):
                errors.append(f"{rel}: broken reference `{ref}`")

    # Leak checks cover every file that ships, not just the skills.
    for path in sorted(distributable_files()):
        rel = path.relative_to(ROOT)
        try:
            text = path.read_text()
        except UnicodeDecodeError:
            continue
        if FIGMA_FILE_RE.search(text):
            errors.append(f"{rel}: contains a real Figma file URL — project data belongs in PROJECT.md")
        for pattern in denylist:
            if pattern.search(text):
                errors.append(f"{rel}: matches private denylist pattern")

    for manifest in (ROOT / ".claude-plugin").glob("*.json"):
        try:
            data = json.loads(manifest.read_text())
        except json.JSONDecodeError as exc:
            errors.append(f"{manifest.relative_to(ROOT)}: invalid JSON ({exc})")
            continue
        for key in ("name", "description"):
            if not data.get(key) and not (data.get("metadata") or {}).get(key):
                errors.append(f"{manifest.relative_to(ROOT)}: missing '{key}'")

    for item in warnings:
        print(f"warning: {item}")
    for item in errors:
        print(f"error:   {item}")
    failed = errors or (strict and warnings)
    print(f"\n{len(skill_dirs)} skills checked — {len(errors)} errors, {len(warnings)} warnings")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
