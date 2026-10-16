# Project profile — <product name>

<!-- Read by every pd-* skill before it starts. Keep it short and current.
     Field reference: pd-foundations/references/project-profile.md -->

product: <one line — what it is and who it's for>
users:
  - <primary user group — one line>
  - <secondary user group>
platforms: [web]                 # web, ios, android, desktop, …

design_system:
  source: none                   # figma | penpot | pencil | sketch | framer | code | none
  locations: []                  # design-file URLs or paths, or code paths like src/tokens/, packages/ui/
                                 # source: none → pd-design-system-ops establishes a provisional system first
conventions:                     # filled in as the team discovers them
  type_roles: <e.g. role/*>
  tokens: <e.g. color/text/primary, space/4>
  component_props: <e.g. kind / size / state>

design_tool: none                # figma | penpot | pencil | sketch | framer | code-only | none
requirements:
  tracker: brief-only            # linear | jira | github | brief-only
  reference: <how to cite an item, e.g. ABC-123 or an issue URL>
analytics: none                  # amplitude | mixpanel | posthog | ga4 | none

domain_packs: []                 # e.g. [healthcare] — see pd-foundations/references/domains/
compliance:
  accessibility: WCAG 2.2 AA
  regulatory: []                 # e.g. [HIPAA], [GDPR] — only regimes that actually apply

capabilities:                    # last session check — re-verify each session (adaptation.md)
  checked: <YYYY-MM-DD, model / runtime>
  connected: []                  # e.g. [figma-mcp, linear-mcp, browser]
  model: []                      # e.g. [vision, parallel-subagents, web-search, run-code]
  fallbacks: []                  # e.g. ["no analytics: metrics spec only, no results"]

artifacts_dir: docs/design/      # INDEX, LEARNINGS, artifacts, design-system/ live here; this file stays at docs/design/PROJECT.md
locale: [en]                     # product languages / regions

notes: |
  <anything else every specialist should know — constraints, deadlines, brand, prior decisions>
