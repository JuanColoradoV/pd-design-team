# Accessibility

Accessibility is this project's floor, not a feature: every skill holds designs to WCAG 2.2 AA by
default, applied in each discipline rather than checked at the end. The repository itself should meet
the same bar.

## What we commit to

- **Docs:** headings in order, descriptive link text, alt text on every image, tables with header rows,
  and no information carried by color alone.
- **Examples:** coded mocks use semantic HTML, labeled controls, visible focus, targets of at least
  24×24 CSS px, token colors with contrast checked numerically, and reflow at 320 CSS px.
- **Honest claims:** like the skills, we report the checks performed and what wasn't tested rather than
  claiming conformance.

## Known limitations

- The example mock (`examples/pantry-meal-planner/mocks/`) has had automated, contrast, and reflow checks,
  but no screen-reader pass yet. Its QA report lists the open findings.
- The social preview image in `.github/assets/` carries text in an image; the same content is in the
  README as text.
- The skills are written in English. They respond in the user's language and write product copy in the
  project's languages, but the instructions themselves aren't translated yet.

## Report a barrier

If something in this repository or in the guidance the skills give is inaccessible or wrong, please
[open an issue](../../issues/new/choose) with the "Accessibility barrier" template. Reports in English or
Spanish are welcome.
