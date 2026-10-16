# Product-design principles

The shared lens for every `pd-*` decision. When two options compete, prefer the one that honors these
better, roughly in this order.

1. **Evidence over opinion.** Trace decisions to a research finding, a metric, or a stated constraint.
   With no evidence, call the choice a hypothesis to validate.
2. **Clarity over cleverness.** The obvious solution users understand beats the elegant one they don't.
3. **One job per view.** One primary goal and one primary action per screen; everything else is
   visually subordinate.
4. **Hierarchy is the message.** Size, weight, color, and spacing make the most important thing the most
   prominent. If everything is emphasized, nothing is.
5. **Accessibility is a floor.** The project's target level (default WCAG 2.2 AA) is the minimum for
   every screen. See `accessibility.md`.
6. **Consistency.** Reuse existing patterns and real design-system parts before inventing; match
   platform conventions. A new pattern has to earn its novelty.
7. **Progressive disclosure.** Show what's needed now and defer the rest, to cut cognitive load.
8. **Prevent errors before handling them.** Constraints, smart defaults, forgiving input, and
   confirmation for destructive or irreversible actions beat a good error message.
9. **Always show system status.** Loading, success, empty, error, and partial states are part of the
   design. The user should never wonder whether something worked.
10. **Recognition over recall.** Surface options and context so users don't carry information across
    steps.
11. **Respect time and effort.** Minimize steps, typing, and decisions. For each required field or extra
    tap, be able to name its downstream use in one sentence; if you can't, it is a removal candidate, so
    log it as a QA finding.
12. **Content-first.** Design around real content and data (longest names, empty lists, error copy),
    not lorem ipsum or the happy path alone.
13. **Trust and safety.** When data is sensitive (health, money, identity), make the safe action easy
    and the dangerous one deliberate. Domain packs (`domains/`) add specifics.
14. **No manipulative patterns.** Do not drive a metric with dark patterns: confirmshaming, costs
    revealed late, hard-to-cancel flows, disguised ads, pre-checked consent. Pricing, subscription, and
    marketing-funnel work gets extra scrutiny. `pd-ux-qa` checks this explicitly.

## How they show up per discipline

- **Research:** evidence (1); study real tasks and edge users (12).
- **Flows:** one job per view (3), prevent errors (8), respect effort (11); no dead ends.
- **Design:** hierarchy (4), progressive disclosure (7), all states (9), recognition (10).
- **Writing:** clarity (2), recognition (10), error prevention and recovery (8).
- **Visual:** hierarchy (4), consistency (6), contrast (5).
- **Components and system:** consistency (6), accessibility (5), all states (9).
- **Mocks:** content-first (12), all states (9).
- **QA:** every principle becomes a check (see `pd-ux-qa`).
