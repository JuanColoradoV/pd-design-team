# Pantry components (fictional example system)

Pantry is a fictional product. This is the small code-based design system the pd-* team used in this
worked example. Implementation: `components.css` (class API below). Tokens: `../tokens/tokens.css`.
Rule: components use semantic tokens only. Screens never re-declare color, space, or radius.

Conventions (recorded in `docs/design/PROJECT.md`): props are `data-*` attributes (`kind`, `size`),
states are native (`:hover`, `:active`, `:focus-visible`, `[disabled]`, `[aria-busy]`), type roles are
`--role-<group>-<variant>`.

## Button — `.btn`

| Prop | Values |
|------|--------|
| `data-kind` | `primary` · `secondary` · `ghost` (dashed outline, used for "add" affordances) |
| `data-size` | `sm` (min 24px target) · `md` (44px target) |
| state | default · hover · pressed (`:active`) · focus (shared ring) · disabled (`disabled`) · loading (`aria-busy="true"`, label stays, text changes) |

Type role `--role-label-default`. Primary: accent fill, white text. One primary per screen region.

## Card — `.card`

Surface container. `data-padding`: `md` (default, `--space-4`) · `lg` (`--space-5`). Not interactive itself;
put a Button or link inside. Radius `--radius-lg`, shadow `--shadow-card`.

## Checkbox — `.checkbox`

Native `<input type="checkbox">` inside a `<label>`; the whole row is the target (44px). Checked state
dims and strikes the label (color is never the only signal). Focus uses the shared ring.

## Tabs — `.tabs` / `.tab`

`role="tablist"` with `role="tab"` buttons, `aria-selected`, roving behavior left to the host app
(arrow keys, Home/End per the ARIA authoring practices). Selected tab: accent underline plus primary text.

## EmptyState — `.empty-state`

Heading, one sentence, one action. `data-tone`: `neutral` (default) · `error` (status-error surface, for
"couldn't load" cases that otherwise look like empty). Heading level is set by the host (`h2`/`h3`).

## Not in the system yet

See `docs/design/design-system/SYSTEM-BACKLOG.md`: DaySlot, inline Alert, Skeleton.
