# Accessibility floor

The target level comes from `compliance.accessibility` in `PROJECT.md`; the default is WCAG 2.2 Level AA. This is the
practical checklist for that default. Go to the WCAG 2.2 success criteria directly when a case is
unclear, and raise the bar if the project declares AAA items.

## Universal floor (every screen)

- **Contrast (1.4.3, 1.4.11).** Normal text at least 4.5:1. Large text (24px and up, or about 18.66px
  and up if bold, i.e. 18pt / 14pt bold) and meaningful icons or UI-component boundaries at least 3:1.
  Measure against the actual background, including overlays and images.
- **Not color alone (1.4.1).** Pair color with text, an icon, or a pattern (error = red plus icon plus
  message).
- **Keyboard (2.1.1, 2.1.2).** Every interactive element is reachable and operable by keyboard, in a
  logical order, with no traps.
- **Visible focus.** Every focusable element shows a clear indicator (2.4.7 Focus Visible, AA) with at
  least 3:1 contrast against adjacent colors (1.4.11, AA), and focused elements are not hidden by sticky
  headers, banners, or modals. 2.4.11 Focus Not Obscured (Minimum, AA) fails only when the focused
  component is entirely hidden by author-created content; 2.4.12 Focus Not Obscured (Enhanced, AAA)
  fails when any part is hidden. Aim for the stricter behavior, but cite only 2.4.11 in an AA claim.
  2.4.13 Focus Appearance (a specific minimum indicator size and thickness) is also AAA: good practice,
  not an AA citation.
- **Target size.** At least 24x24 CSS px (2.5.8 Target Size (Minimum), AA). Smaller targets pass
  under one of these exceptions: spacing (a 24 CSS px diameter circle centered on the bounding box of
  each undersized target does not intersect another target or that target's circle), an equivalent
  control on the same page that meets the size, an inline target in a sentence or constrained by the
  line-height of surrounding text, a size set by the user agent and not modified by the author, or a
  presentation that is essential or legally required. Prefer 44x44 for touch; that is 2.5.5 Target Size (Enhanced), AAA.
- **Alternatives to dragging (2.5.7, AA).** Anything operated by dragging also works with a single
  pointer without dragging (for example tap or click controls such as move up/down buttons or a
  "move to" menu), unless dragging is essential. A keyboard alternative does not satisfy 2.5.7; keyboard
  operability is a separate requirement (2.1.1), so provide both.
- **Names and labels (4.1.2, 3.3.2).** Every control has a programmatic name, inputs have visible
  associated labels, icon-only buttons have accessible names.
- **Structure (1.3.1, 2.4.6).** Headings and landmarks convey real structure, headings and labels are
  descriptive, and reading order is meaningful. A single `h1` and a logical heading order are common best
  practice, not a WCAG requirement.
- **Motion.** Nothing flashes more than 3 times in any one second unless the flashes stay below the
  general and red flash thresholds (2.3.1, A); the team's stricter default is no more than 3 flashes per
  second, full stop; auto-moving content can be
  paused (2.2.2, A). Honor `prefers-reduced-motion`: not an AA criterion (2.3.3 is AAA), but vestibular
  disorders make it worth doing everywhere.
- **Text scaling (1.4.4, 1.4.10).** Works at 200% text zoom and reflows at 320 CSS px width (the 400%
  zoom case) without losing content or function; never disable user scaling.
- **Errors and forms (3.3.1, 3.3.3, 3.3.7, 3.3.8).** Identify the field, describe the problem in text,
  suggest a fix. Don't make users re-enter information already given (Redundant Entry, A). Don't require
  a cognitive test for login, and allow paste and password managers (Accessible Authentication
  (Minimum), AA). For time limits (2.2.1, A), let users turn the limit off, adjust it to at
  least 10× the default, or be warned before it expires with at least 20 seconds to extend it with a
  simple action, at least ten times — unless the limit is real-time, essential, or over 20 hours.
- **Consistent help (3.2.6, A).** Help mechanisms appear in the same place across pages.

## By discipline

| Discipline | Check |
|------------|-------|
| `pd-ux-research` | Recruit participants with disabilities; include keyboard and screen-reader users; note assistive tech used. |
| `pd-ux-flows` | A keyboard path exists end to end; no dead ends; error recovery; nothing depends on hover alone. |
| `pd-ux-design` | Focus order, visible focus, target sizes, every state (focus, disabled, error), zoom and reflow. |
| `pd-ux-writing` | Plain language; descriptive link text; clear labels; helpful errors; intent of alt text. |
| `pd-visual-design` | Contrast on real tokens; meaning not carried by color alone; readable sizes and line length. |
| `pd-design-system` | Components carry semantics, names, and focus/disabled/error states; a11y documented per component. |
| `pd-mocks` | Annotate focus order, labels, alt text, reading order; show error, empty, and loading states. |
| `pd-ux-qa` | Automated scan, manual keyboard pass, contrast check, screen-reader spot check; AA failures are defects. |

## Quick contrast reference

| Content | Minimum |
|---------|---------|
| Normal text | 4.5:1 |
| Large text (24px, or about 18.66px bold) | 3:1 |
| Icons, UI component boundaries, focus indicators | 3:1 |

Bind colors to design-system tokens and verify the resolved ratio for the specific pairing; a token can
pass on one background and fail on another.
