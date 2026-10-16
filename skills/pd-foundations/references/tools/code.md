# Code adapter

Use this when `design_system.source` in `PROJECT.md` is `code` (with paths in `design_system.locations`), or when mocks are built as code. The
principles in `design-system.md` are unchanged: the source is the truth, bind rather than hardcode,
never invent names.

## Detect

- Repo: token files (CSS custom properties, design-token JSON, `tailwind.config.*`, theme files),
  a component library directory, Storybook (`.storybook/`, `*.stories.*`).
- Brief: a repo path or a deployed Storybook URL.
- Tools: a shell and a browser tool, if present, to run and screenshot the app. No design MCP is needed.

## Capabilities

Typical; verify in session. Read system: yes, from source. Write canvas: yes, as code. Render/screenshot:
yes with a browser tool, otherwise code-only. Inspect bindings: yes, via computed styles and a search for
literals. Prototype: yes, running code. Export: the code itself.

## Read the system

- **Tokens.** Look for CSS custom properties (`:root { --color-text-primary: ... }`), design-token JSON
  (W3C format or Style Dictionary output), a Tailwind config (`theme.extend`), or theme files
  (TypeScript/JS theme objects). Search for the token directory, then read the files; don't infer names
  from usage in one component.
- **Components.** Look for a component library directory, and Storybook (`*.stories.*`) as the catalog
  of variants and states. The prop types or story args are the real property axes.
- Record the paths and the conventions found (token naming pattern, type-role scheme, prop axes) in
  `PROJECT.md` so the next agent doesn't re-discover them (`design-system.md`).

### Read real names from source

Quote token and prop names exactly as they appear in the source. When a semantic token aliases a
primitive, use the semantic one. If the value you need has no token, flag it to `SYSTEM-BACKLOG` and use
the closest existing token with the substitution noted; don't add an ad hoc literal.

## Write

Build with the library's real components and props and token references, never ad hoc literals. Missing token or variant: flag to `SYSTEM-BACKLOG`, use the closest, note the substitution.

## Audit

Run after each batch of screens or components, for the same reason as the other adapters' audits (`README.md`): output can look
right while bindings are wrong. For each:

- Colors, spacing, radius, shadow, and type resolve to tokens (no literals, no near-miss values that
  merely resemble a token).
- Components are the library's real components with real props, not re-implemented lookalikes.
- Text does not clip or overflow at narrow widths and long-content cases.
- All states render, with realistic content.

Report findings in one table — `Screen | Issue type | Detail | Severity` (severity from `compliance.md`)
— and fix before the next batch.

### Render checks

1. **Run it.** Start the app or Storybook with the project's own script (check `package.json`), and load
   the screen or story for every state: default, loading, empty, error, partial, disabled, focus.
2. **Screenshot** if a browser tool is available, at the project's key breakpoints. Without one, say the
   check was code-only.
3. **Computed styles.** In the browser, confirm elements reference tokens, not literals: the computed
   color should trace to a `var(--...)` in the stylesheet. Search the changed files for raw hex values,
   raw px for spacing, and font-family strings that bypass the type roles.
4. **Accessibility pass.** Tab through it for focus order and visible focus; run an automated checker
   if installed; check contrast on the resolved values (`accessibility.md`).

## Export & handoff

The code is the deliverable; `pd-handoff` maps tokens and components to the implementation.

## Known quirks

None recorded. Record project-specific quirks in the project's `LEARNINGS.md`; propose general tool quirks upstream.
