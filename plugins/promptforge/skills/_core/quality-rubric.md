# PromptForge Quality Rubric

Every refined implementation prompt must score itself against these dimensions before presenting results to the developer.

Scoring: 0 (completely absent) to 5 (excellent).

A score below 4 in any dimension requires an explanation of what needs improvement.

---

## Dimensions

### Clarity (0–5)

| Score | Meaning |
|-------|---------|
| 5 | Every requirement is unambiguous. A developer can implement without asking clarifying questions. |
| 4 | Minor ambiguities exist but do not block implementation. Documented as open questions. |
| 3 | Some requirements are vague. Would cause rework without developer clarification. |
| 2 | Multiple requirements are ambiguous. Significant clarification needed before implementation. |
| 1 | The intent is unclear. Multiple reasonable interpretations exist with no guidance. |
| 0 | The request is unintelligible or entirely missing. |

### Completeness (0–5)

| Score | Meaning |
|-------|---------|
| 5 | All known requirements, constraints, dependencies, and edge cases are captured. Nothing obvious is missing. |
| 4 | Minor gaps exist but are documented as assumptions or open questions. |
| 3 | Some significant aspects are missing (e.g., error handling, testing, deployment). |
| 2 | Major sections are incomplete. Core functionality is underspecified. |
| 1 | Only the most basic aspects are addressed. Critical information is absent. |
| 0 | The output is skeletal. No meaningful refinement occurred. |

### Testability (0–5)

| Score | Meaning |
|-------|---------|
| 5 | Every requirement has specific, verifiable acceptance criteria. No vague language. |
| 4 | Most requirements have testable criteria. A few use subjective language but can be operationalized. |
| 3 | Some criteria are vague ("user-friendly", "fast"). Would need revision before writing tests. |
| 2 | Many criteria are subjective. Significant rework needed to make them testable. |
| 1 | Acceptance criteria are absent or entirely vague. |
| 0 | No testing consideration whatsoever. |

### Technical Feasibility (0–5)

| Score | Meaning |
|-------|---------|
| 5 | The requirements are achievable with the stated stack and constraints. No technical blockers. |
| 4 | Minor technical challenges exist but have clear solutions. |
| 3 | Some aspects may require technology choices that need developer confirmation. |
| 2 | Significant technical gaps or conflicting constraints exist. |
| 1 | The requirements are technically infeasible as stated. |
| 0 | No technical analysis was performed. |

### Scope Control (0–5)

| Score | Meaning |
|-------|---------|
| 5 | Scope is explicitly defined. Non-goals are clearly listed. No risk of accidental expansion. |
| 4 | Scope is mostly defined. Non-goals are present. Minor ambiguity about boundaries. |
| 3 | Scope is stated but some boundaries are fuzzy. Non-goals are incomplete. |
| 2 | Scope is vague. No clear non-goals. High risk of scope creep. |
| 1 | No scope definition. The refinement could expand indefinitely. |
| 0 | No scope or non-goals at all. |

---

## Review Process

When scoring:

1. Score each dimension independently.
2. For any score below 4, write a one-sentence explanation of what needs improvement.
3. If any score is below 3, recommend what additional information or refinement is needed.
4. Present scores honestly. Do not inflate scores to avoid presenting problems to the developer.

---

## Example Self-Assessment

```markdown
## Quality Review

| Dimension | Score | Notes |
|-----------|-------|-------|
| Clarity | 4 | Requirements are mostly clear. "Fast" in the API needs a specific latency target. |
| Completeness | 3 | Missing: caching strategy, rate limiting details, monitoring approach. |
| Testability | 4 | Most criteria are specific. "Good UX" should be replaced with concrete interaction patterns. |
| Technical Feasibility | 5 | No blockers. Stack choices are consistent with the existing project. |
| Scope Control | 5 | Scope and non-goals are explicitly defined. |

**Improvements needed:**
1. Add latency targets to replace vague "fast" requirement.
2. Define caching strategy (Redis? in-memory? CDN?).
3. Add monitoring and alerting requirements.
```
