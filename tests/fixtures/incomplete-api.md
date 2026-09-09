# Incomplete API Request

## Raw Input

```
create an api for uploading files
```

## Context

This fixture is used to test that the refinement process handles extremely vague requests by:
- Surfacing a large number of missing decisions
- Making many explicit assumptions
- Not inventing specific technologies without confirmation
- Presenting the request as having multiple valid interpretations

## Expected Sections in Refined Output

1. Original Request
2. Understanding (with alternative interpretations)
3. Confirmed Requirements (very few — the request is minimal)
4. Assumptions (at least 5, all labeled)
5. Missing Decisions (at least 5 questions)
6. Scope
7. Non-Goals (at least 5)
8. Repository Context (or "N/A — new project")
9. Refined Implementation Prompt with all subsections
10. Quality Review
11. Approval gate

## Validation Criteria

- [ ] At least 5 assumptions are present and explicitly labeled
- [ ] At least 5 open questions are present in Missing Decisions
- [ ] At least 2 alternative interpretations are presented in Understanding
- [ ] At least 5 non-goals are listed
- [ ] Repository Context includes inspection requirements
- [ ] No specific technology is mandated without justification
- [ ] Quality Review notes that the request is highly ambiguous
- [ ] Approval gate statement is present
- [ ] No code implementation appears in the output
- [ ] Acceptance criteria are testable (no vague language)
