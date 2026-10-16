# Healthcare domain pack

Load this when the work touches healthcare, clinical, telehealth, or EHR and practice-management contexts, and list it in `domain_packs` in `PROJECT.md`. For other work, skip it. In these settings
design errors carry clinical, legal, and financial risk, so the bar for clarity, safety, and trust is
higher than the universal floor in `principles.md` and `accessibility.md`.

## Context

Typical users include clinicians (physicians, nurses, therapists, other licensed providers), front-desk and coordination staff,
billers, and patients. Clinical staff work under time pressure, often on mobile devices and sometimes
gloved or bedside. Patients are often anxious, non-expert, and skew older or impaired. Products in scope:
charting and encounter documentation, scheduling, patient portals and messaging, e-prescribing,
billing and revenue cycle, and clinical photos or other sensitive media handled with patient consent.

## Regulatory regime

HIPAA (US) governs protected health information (PHI): any health data tied to an identifiable person.
Other regimes may apply by jurisdiction: GDPR treats health data as special-category data with stricter
conditions, and other countries have their own health-data laws. Verify which regimes bind the project
and record them in `compliance.regulatory` in `PROJECT.md`. Design supports compliance; it does not certify it
(see Honesty caveats). Mark this pack's regulatory audit as active in `pd-ux-qa` when PHI is in scope.

## PHI and privacy: UI rules

- **Minimum necessary.** Show only the PHI a role needs for the task at hand, with role-based views.
- **Keep PHI out of side channels:** URLs and query strings, logs, analytics events, browser tab titles,
  push and email notifications, previews. A notification says "You have a new message," not its content.
- **Mask sensitive fields by default** (SSN, date of birth, full chart) and reveal explicitly where
  justified.
- **Assume an audit trail.** Sensitive views and edits are logged; design with that, not around it.
- **Session safety.** Inactivity timeout with warning and a way to extend, obvious sign-out, re-auth for
  sensitive actions.
- **No PHI in error messages or empty states** that may be seen by the wrong audience.

## Consent and sensitive media

- Clinical photos and other sensitive media are PHI. Separate clinical use from any other use, and
  require explicit, scoped patient authorization before any sharing or publishing. Show consent status
  on the asset.
- Restrict download and sharing, and keep clinical images private by default.
- Make consent capture and revocation a legible, first-class flow, not fine print.

## Clinical workflow patterns

- **Optimize the high-frequency path.** Charting, scheduling, and encounter documentation happen dozens
  of times a day; cut clicks and typing there first, with smart defaults from context (provider,
  location, appointment type).
- **Prevent high-stakes errors.** Confirm irreversible or clinical actions (deleting a chart note,
  sending a prescription, finalizing a claim), and make the safe action the easy default.
- **Avoid alert fatigue.** Reserve interruptive alerts for critical, actionable events; rank by severity.
- **Status is safety.** Appointment, claim, result, and signed/unsigned note states must be unambiguous
  and not color-only.
- **Tolerate poor connectivity.** Never lose entered data on mobile clinical use.

## By discipline

### Research
Recruit the real roles (clinicians, nurses, coordinators, billers, patients). Research data can itself
contain PHI: de-identify it in artifacts and handle recordings and notes accordingly. Consent applies by
default.

### Flows
Model clinical edge cases explicitly: incomplete charts, missing consent, offline capture,
role and permission gates, interruptions mid-task. These are the norm, so design the flow to tolerate
them.

### Architecture
Structure navigation and objects around roles and permissions; what a billing user sees differs from
what a clinician or patient sees. Treat PHI-bearing objects (chart, photo, claim) as such in the model.

### Design
Make the high-frequency clinical path the most efficient. Require confirmation for clinical, financial,
and irreversible actions. Make status unambiguous and color-independent. Design for incomplete data and
poor connectivity.

### Writing
Patient-facing copy is plain and reassuring, free of medical jargon, and gives no medical advice.
Clinical-facing copy is precise and unambiguous. No PHI in notifications, titles, or previews. Consent
copy is legible and plain.

### Visual
Trust-forward restraint: clarity over flourish. Status colors (appointment, claim, result states) pass
contrast and are reinforced by text or an icon.

### Design system
Verify that `disabled`, `loading`, and `error` variants exist for any control used in clinical or
financial actions; flag gaps to `SYSTEM-BACKLOG`.

### Mocks
Use realistic but de-identified data, never real PHI in shared frames. Build the clinical states
(incomplete chart, missing consent, offline). Keep PHI out of frame names and exports.

### Prototyping
Use de-identified data in shared prototypes. Honor reduced motion, which matters for clinical and older
patient users.

### Responsive
Bedside mobile use means large targets, forgiving layouts, and offline tolerance. The patient app skews
to older or impaired users (accessibility first). Web admin tends to be dense.

### QA
Run the regulatory audit: PHI leakage (URLs, logs, analytics, notifications, titles, previews), masking,
role-based views, session timeout and re-auth, and consent for sensitive media. A PHI leak is Critical.

### Handoff
Annotate PHI-handling requirements next to edge cases (what must not be logged, cached, or sent in
notifications), and permission gates per role.

### Metrics
Instrument without PHI: no identifiers or health details in event names or properties. Prefer
aggregate, de-identified measures, and have analytics reviewed against the privacy regime.

## Glossary

| Term | Meaning |
|------|---------|
| EHR / EMR | Electronic health / medical record |
| PHI | Protected health information |
| HIPAA | US law governing PHI privacy and security |
| Encounter / Visit | A documented interaction between patient and provider |
| Chart | The patient's full clinical record |
| SOAP note | Subjective / Objective / Assessment / Plan note format |
| CPT / ICD-10 | Procedure codes / diagnosis codes (billing) |
| Superbill / Claim | Billing document submitted to a payer |
| e-Prescribe (eRx) | Electronic prescription sent to a pharmacy |
| RCM | Revenue cycle management (billing lifecycle) |
| Consult | Consultation appointment, often before a procedure or treatment plan |

## Honesty caveats

Design supports HIPAA-aware practice; it does not certify compliance, which is organizational and
technical as well as UI. Say a design "follows HIPAA-aware UI practices," never that it "is HIPAA
compliant," and recommend formal security, legal, and compliance review. HIPAA is US law: verify the
jurisdiction and any other regime (such as GDPR special-category rules) that applies. This is not legal
or medical advice, and copy must not give medical advice.
