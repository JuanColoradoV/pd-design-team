# Adaptation — evaluate the setup, learn from the work

The team runs on many models, runtimes, and design tools, and every project is different. Instead of
assuming one setup, it runs three loops: it evaluates what it has at the start, it learns from each effort
on a project, and maintainers evaluate it against each new model.

## 1. Session check — evaluate before you plan

Connections and capabilities change between sessions, so check at the start of each effort rather than
trusting last time. `pd-design-lead` runs this; a specialist working alone runs the part it needs.

**Tools actually connected.** Look at the tool list available in this session — don't infer from the
profile alone. Note which design-tool MCPs (Figma, Pencil, Penpot, Sketch, Framer, …), trackers, analytics,
browsers or renderers, diagram tools, and web search are present.

**What the model can do here.**

| Capability | Why it matters | If missing |
|------------|----------------|------------|
| Vision (read images) | Visual inspection: clipping, overlap, icon shapes, reading exported frames. Contrast does not need vision when resolved color values are available | Ask for inspect-panel values or exported specs; verify contrast numerically from tokens or computed styles; say visual checks weren't run |
| Parallel subagents | Run writing ∥ visual concurrently | Run in sequence — same artifacts, same result |
| Web search | Research sourcing rule, current standards | Label market claims as assumptions; say so |
| Render or run code | Code mocks, computed-style checks, a11y scans | Ship the spec; mark rendered checks as not performed |
| File write | Artifacts on disk | Return artifacts inline and ask the user to save them |

**Then adapt the plan.** Pick the adapter for each tool from `tools/README.md`, choose the fallback rung
for anything missing, and say in the plan what you could not check and why. Record the result under
`capabilities` in `PROJECT.md` with the date, so the next agent starts from a known state but still
re-checks.

Never claim a check that needed a capability you didn't have. "Contrast verified" with neither visual
evidence nor numeric evidence (resolved color values from inspect data, tokens, or computed styles) is a
fabricated finding.

## 2. Project learning — adapt to this project

Each project teaches the team things that no generic skill can know: the stakeholder who always wants the
data table first, the component that clips in German, the token the brand team retired. Those lessons
live in the project, in `docs/design/LEARNINGS.md` (template: `templates/LEARNINGS.md`).

**Capture.** Add an entry when:
- the user corrects the team ("no, our users never see that screen on mobile");
- QA finds a defect whose root cause would recur (a missed state, a wrong assumption, a tool quirk);
- a tool behaves differently from its adapter's description.

Each entry says what happened, the root cause, the rule for next time, which disciplines it applies to,
and the evidence (QA finding, artifact, or the user's words).

**Apply.** Every specialist reads the entries tagged with its discipline before it starts, alongside
`PROJECT.md`, and applies only entries with status `active`; `retired` entries are history. The artifact
cites the IDs of the learnings it applied (a "Learnings applied" line, see `templates/artifact.md`). A learning refines how the contract is applied on this project; it never overrides the user
or the accessibility floor.

**Retro.** When an effort closes, `pd-design-lead` runs a short retro: group the QA findings and user
corrections by root cause, add or update learnings, and retire entries that turned out wrong or no longer
apply (mark them `retired`, don't delete them).

**Upstream.** If a learning isn't project-specific — the skill itself gave bad guidance — don't edit the
installed skill files. Note it in the retro as a proposed improvement to the skill, so a maintainer can
fix it in the source and re-run the evals.

## 3. Model evaluation — adapt to new models

Models change how they read instructions. The repo's `evals/` suite holds behavioral scenarios for every
skill. When a new model or runtime appears, maintainers run the suite, record results per model and date,
and fix the skill wording behind any failure — then re-run until it passes. See `evals/README.md` in the
repository.
