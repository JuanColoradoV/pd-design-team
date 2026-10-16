# System review checklist (Mode B)

Re-sync the live system first, then audit each area and report as a table:
item · issue · severity (Critical/High/Medium/Low, the scale in `compliance.md`) · recommendation.

| Area | Looks for |
|------|-----------|
| Naming | Consistent, predictable conventions for styles and variant properties |
| Variant completeness | Each interactive component has the states it needs (default, hover, pressed, focused, disabled, loading, error) |
| Token coverage | Semantic tokens exist; no near-duplicates; no orphan raw values |
| Deprecation hygiene | Marked and documented; unused in new work; swept at MAJOR |
| Accessibility | Variant contrast passes; focus states; target sizes; semantics documented |
| Documentation | Purpose, usage, do/don't per part |
| Orphaned variants | Defined but never referenced (removal candidates) |
| Component drift | Detached copies or hand-built lookalikes of system components |
