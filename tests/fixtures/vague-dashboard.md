# Vague Dashboard Request

## Raw Input

```
make me a dashboard for sales with login and charts
```

## Context

This fixture is used to test that the refinement process:
- Extracts confirmed requirements from vague input
- Labels assumptions explicitly
- Surfaces missing decisions
- Defines scope and non-goals
- Produces testable acceptance criteria
- Includes the approval gate

## Expected Sections in Refined Output

1. Original Request
2. Understanding
3. Confirmed Requirements
4. Assumptions (at least 3, all labeled)
5. Missing Decisions (at least 3 questions)
6. Scope
7. Non-Goals
8. Repository Context
9. Refined Implementation Prompt with all subsections:
   - Objective
   - Existing Context
   - User Stories
   - Functional Requirements
   - Technical Constraints
   - Data Requirements
   - API Requirements
   - UI / UX Requirements
   - Error States
   - Empty States
   - Security Requirements
   - Testing Requirements
   - Acceptance Criteria (at least 3, all testable)
   - Implementation Phases
   - Verification Commands
10. Quality Review
11. Approval gate

## Validation Criteria

- [ ] At least 3 assumptions are present and explicitly labeled as "Assumption"
- [ ] At least 3 open questions are present in Missing Decisions
- [ ] Scope is explicitly defined (not implied)
- [ ] Non-goals are explicitly listed (at least 3)
- [ ] At least 3 acceptance criteria use "Given/When/Then" or equivalent testable format
- [ ] No acceptance criteria use vague language ("user-friendly", "performant", "nice")
- [ ] Quality Review table has all 5 dimensions scored
- [ ] Approval gate statement is present
- [ ] No code implementation appears in the output
- [ ] At least 2 implementation phases are defined
