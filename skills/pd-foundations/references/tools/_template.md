# <Tool> adapter

One or two lines: what the tool is, and when `design_tool` is `<value>`. State what was verified in a live
session and what is reported or hedged. Add the tool to the index in `README.md`.

## Detect

- Repo files: file extensions or config that signal the tool.
- Brief: URL patterns or file names a user might paste.
- MCP: tool names to look for in the session's tool list. Say what to do if none are present (fallback
  ladder in `README.md`).

## Capabilities

Mark each "typical; verify in session": read system, write canvas, render/screenshot, inspect bindings,
prototype, export. Write "not offered" rather than leaving a gap.

## Read the system

How to list tokens, styles, and components, and any selection or scope needs. Quote names exactly.

## Write

How to build with real parts. Keep the rules from `design-system.md`: bind, never invent names, flag gaps.
Note any workflow the tool requires before writing (for example a docs or schema call).

## Audit

Name the calls or checks for each audit item in `README.md` (clipping, overflow, binding, instance
integrity, type-style binding, icons, alignment), the report table, and the 2-attempt limit. List any
item the tool cannot check.

## Export & handoff

Formats available and where they feed `pd-handoff`.

## Known quirks

Observed or reported behavior, labeled and dated. Remove entries once they stop being true.
