# Research methods catalog

## Method selection

Two dimensions decide the method, not only the question type: **attitudinal vs. behavioral** (what people
say vs. what they do; these often disagree) and **qualitative vs. quantitative** (why/how vs. how many).
Pick by question type, then sanity-check against both axes.

| Question type | Empirical methods (real users) | Expert/inspection methods (no users; findings are predicted problems, not validated ones) |
|---|---|---|
| "What's going on / what do they need?" (generative) | Interviews (attitudinal), contextual inquiry / field observation (behavioral), diary studies (behavioral over time) | Competitive/comparative review |
| "Does this design work?" (evaluative) | Usability testing (behavioral, with tasks) | Heuristic evaluation, cognitive walkthrough |
| "How many / how often / how much?" (quantitative) | Analytics (behavioral, correlational, no causal claims), A/B testing (behavioral, causal), surveys (attitudinal, self-report; needs real data) | none |
| "What exists already?" (secondary) | Desk research, competitive teardown | none |

- A heuristic evaluation or cognitive walkthrough is not equivalent evidence to a usability test with real
  users. Inspection surfaces candidate problems an expert predicts; only testing with users confirms them.
  Label such findings as heuristic-evaluation findings.
- Support-ticket and review mining is not desk research. It is real but self-selected user data, skewed
  toward complaints and extreme experiences. Treat it like analytics: real signal, correlational, biased
  toward the vocal minority.
- If the study cannot be run in this environment, design it (questions, recruit criteria, method, analysis
  plan) and hand it off, clearly marked as a plan, not results.

## Sampling and saturation

- Qualitative interview studies: collect until themes stop changing (thematic saturation). For a
  homogeneous group this is typically around 9-12 interviews (Guest et al.). Heterogeneous populations need
  more, per segment.
- Write recruitment/screening criteria up front: who qualifies, who is excluded, how many per segment.
  Sample bias invalidates findings however rigorous the analysis.
- Pilot the discussion guide or survey on one person to catch leading or confusing questions.
- Small-n is valid when labeled ("n=5, directional"), and not generalized to "users want...".

## Interviewing without bias

- Prefer open, neutral prompts: "Walk me through the last time you..." rather than "Don't you find X
  frustrating?"
- Probe for disconfirming evidence on purpose, not only for support of the working theory.
- Get informed consent for participation and recording, and state how data is stored and de-identified,
  before collecting anything. This applies to all human-subjects research.

## Synthesis

- Cluster into themes (affinity mapping); separate signal from anecdote.
- Triangulate before elevating to a Finding: a second method or source (interview pattern confirmed by
  analytics) or the same pattern in independent participants.
- Record disconfirming evidence alongside confirming instances.

## Framing outputs

- **Jobs-to-be-done:** the progress a user is trying to make in a specific circumstance. Form: "When
  [situation], I want to [motivation/action], so I can [expected outcome]." Capture functional, emotional,
  and social dimensions and what the user currently hires (or fires) to make the progress. A JTBD is not a
  persona and not a task list.
- **Personas:** evidence-based behavioral archetypes (goals, pain points, decision patterns seen across
  multiple participants), not demographic sketches. With a thin evidence base, label it a proto-persona or
  assumption-persona: something to validate, not a finding.
- **Journey inputs and opportunities:** prioritized pain points, each tied to the evidence behind it.
