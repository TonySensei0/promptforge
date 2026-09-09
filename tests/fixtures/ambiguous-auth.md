# Ambiguous Auth Request

## Raw Input

```
add google login
```

## Context

This fixture tests that the refinement process handles a seemingly simple request that has hidden complexity:

- Requires understanding the existing authentication system
- Requires handling account linking scenarios
- Requires understanding OAuth security implications
- Should surface questions about existing users and data migration

## Expected Sections in Refined Output

1. Original Request
2. Understanding (with the implicit assumption that this adds to an existing system)
3. Confirmed Requirements
4. Assumptions (at least 3)
5. Missing Decisions (at least 3)
6. Scope
7. Non-Goals (at least 3)
8. Repository Context (requires inspection — existing auth system)
9. Refined Implementation Prompt with all subsections including security focus
10. Quality Review
11. Approval gate

## Validation Criteria

- [ ] At least 3 assumptions are present and explicitly labeled
- [ ] Repository Context notes that inspection is required for existing auth system
- [ ] At least 3 security requirements are listed
- [ ] At least 3 open questions about account linking/data migration
- [ ] OAuth security considerations are mentioned (state parameter, token verification)
- [ ] At least 3 non-goals are listed
- [ ] Quality Review notes the dependency on repository inspection
- [ ] Approval gate statement is present
- [ ] No code implementation appears in the output
