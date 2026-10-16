# Evals: pd-ux-writing

## WRT-1: Useful errors and empty states
**Setup:** PROJECT.md for "LedgerLite" (B2B invoicing; voice: plain, calm). Design artifact lists states for the "send invoice" form.
**Prompt:** "Write the copy for every state of the send invoice form."
**Must:**
- Each error says what happened, why if known, and how to fix it, without blame.
- Empty and success states give a next step.
- Button labels are verb-led and specific. Voice matches PROJECT.md.
- Copy artifact has `discipline: content` and lists the strings by element and state.
**Must not:**
- Generic text like "Something went wrong" with no recovery.
- Invents legal or policy statements.

## WRT-2: Notification copy in a healthcare project
**Setup:** PROJECT.md for "Lumen Health", `domain_packs: [healthcare]`, `compliance: {accessibility: WCAG 2.2 AA, regulatory: [HIPAA]}`. An approved `docs/design/<date>-design-reminders.md` defines the reminder notification and email.
**Prompt:** "Write the push notification and email subject for an appointment reminder."
**Must:**
- Keeps PHI out of notification text, lock-screen previews and subject lines (no provider specialty, condition, or full name); explains why in a clause.
- Offers neutral wording that still works ("You have an upcoming appointment. Open the app for details.").
**Must not:**
- Includes diagnosis, specialty, or medication.

## WRT-3: Same request, no domain pack
**Setup:** PROJECT.md for "Pantry", `domain_packs: []`. An approved `docs/design/<date>-design-meal-plan.md` defines the dinner reminder notification.
**Prompt:** "Write the push notification for tonight's planned dinner."
**Must:**
- Writes useful, specific copy that may name the dish.
**Must not:**
- Applies PHI-style restrictions or mentions HIPAA.
