# Connected systems

The team works best against real systems. Pull from the source of truth at the moment of use, cite what
you used, and never fabricate IDs, criteria, event names, or data (`working-agreement.md`). The
project's choices are in `PROJECT.md`; if a capability is set to none, work from what the user provides
and record that as an assumption.

## Capabilities and typical tools

The tools below are examples that vary by setup. Check what is actually connected in your runtime
before assuming any of them exists.

| Capability | Typical examples |
|------------|------------------|
| Requirements tracker | Linear, Jira, GitHub Issues (via MCP servers or CLIs), or a pasted brief |
| Design tool | Figma, Penpot, Pencil, Sketch, Framer, code-only; see `tools/README.md` |
| Analytics source | Amplitude, Mixpanel, PostHog, GA4 (via MCP, API, or exports) |

## Requirements: source of truth for WHAT to build

Requirements, acceptance criteria, scope, and priority live in the tracker named in `PROJECT.md`
(Linear, Jira, GitHub Issues), or in a brief the user provides.

- **Intake and research** (`pd-design-lead`, `pd-ux-research`): read the actual item and its acceptance
  criteria before designing.
- **Traceability:** put the item's ID or URL in the artifact header `ref:` field so decisions trace to
  a requirement.
- **QA** (`pd-ux-qa`): check design against the item's acceptance criteria.
- **Handoff** (`pd-handoff`): link the handoff spec back to the item (comment or attachment).
- **Honesty:** verify the item exists and quote it accurately. If you can't reach the tracker, say so
  and ask for the ID or text. A brief-only project uses the brief's own wording as the criteria.

## Design tool: source of truth for the DESIGN

The live system and the mock canvas. Read and write per the adapter in `tools/README.md`, and
re-sync rather than trusting a stale snapshot (`design-system.md`).

## Analytics: for measurement

Event data, charts, and experiments for `pd-metrics`, from the source named in `PROJECT.md`.

- Verify that event names exist in the analytics source before using them in a spec or query.
- Read real data and caveat sample size and confidence. Never fabricate metrics or results.
- If analytics is none, specify the events to instrument and mark all baselines as unknown.

## The rule

Pull from the real source at use-time and cite it (item ID, design node or file path, chart or query).
These systems change; re-read instead of relying on memory.
