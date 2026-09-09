# Performance Problem Request

## Raw Input

```
my api is slow fix it
```

## Context

This fixture tests that the refinement process handles a bug report by:

- Applying the debug profile lens
- Requiring reproduction steps
- Identifying missing diagnostic information
- Not jumping to implementation without diagnosis
- Proposing a structured investigation approach

## Expected Sections in Refined Output

1. Original Request
2. Understanding (recognizing this as a bug report)
3. Confirmed Requirements (minimal — "fix the slow API")
4. Assumptions (about what "slow" means, what the likely causes are)
5. Missing Decisions (which endpoint, how slow, when it started, etc.)
6. Scope (diagnosis + fix + monitoring)
7. Non-Goals (no full optimization, no infrastructure changes)
8. Repository Context (requires inspection)
9. Refined Implementation Prompt with debug-specific sections:
   - Bug Summary
   - Reproduction Steps
   - Expected vs. Actual Behavior
   - Evidence (logs, profiles)
   - Root Cause Analysis
   - Hypotheses
   - Recommended Fix
   - Regression Test
10. Quality Review
11. Approval gate

## Validation Criteria

- [ ] Request is recognized as a bug report/debug scenario
- [ ] At least 3 assumptions are present and labeled
- [ ] At least 3 diagnostic questions are in Missing Decisions
- [ ] Scope includes diagnosis before implementation
- [ ] Repository inspection is flagged as critical
- [ ] A hypotheses table is present in the debug output
- [ ] Quality Review notes the high ambiguity of the request
- [ ] Approval gate statement is present
- [ ] No implementation (no code) appears in the output
- [ ] Non-goals prevent premature optimization
