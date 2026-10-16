# Project profile — Pantry

<!-- FICTIONAL product used as a worked example for the pd-* design team. No real company, person, or data. -->

product: Pantry (fictional), a recipe app for home cooks. This effort adds weekly dinner planning and a derived shopping list.
users:
  - Home cooks who save recipes and cook most weeknight dinners for themselves or a household
  - Household co-shoppers who only see the shopping list (assumption, see research artifact)
platforms: [web, mobile-web]

design_system:
  source: code
  locations: [src/tokens/tokens.css, src/components/components.css, src/components/README.md]
conventions:
  type_roles: "--role-<group>-<variant> (font shorthand), e.g. --role-body-default, --role-label-default"
  tokens: "--color-<role>-<variant>, --space-<1..8>, --radius-<sm|md|lg|pill>, --size-*, --border-width-*"
  component_props: "data-kind / data-size / data-tone / data-padding; states are native (:hover, :active, [disabled], [aria-busy])"

design_tool: code-only
requirements:
  tracker: brief-only
  reference: "brief: 'plan the week's dinners from saved recipes + shopping list' (no ticket ID exists)"
analytics: none

domain_packs: []
compliance:
  accessibility: WCAG 2.2 AA
  regulatory: []

capabilities:
  checked: 2026-10-15, AI agent (Claude) in a shell-and-file runtime
  connected: [shell, file-write, headless-chrome-cli]
  model: [vision (reads PNG screenshots), run-code, file-write]
  fallbacks:
    - "no design-tool MCP needed: code-only, mocks are HTML"
    - "no web search used: research is desk/assumptions, all market claims stay Assumption"
    - "no screen reader, no axe-core/Lighthouse installed: AT and automated-scan checks not performed"
    - "no parallel subagents: writing and visual run in sequence"
    - "no analytics: metrics step skipped"

artifacts_dir: docs/design/
locale: [en]

notes: |
  Fictional example. The plan was approved by the user (see 00-plan.md).
  The design system is deliberately small and was created for this example (src/).
