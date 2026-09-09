# PromptForge Tests

This directory contains fixture-based tests for PromptForge refinements.

## Test Philosophy

These tests are **structural regression tests**, not quality assertions. They verify that refinement outputs contain all required sections and follow the output format. They do not attempt to prove that an LLM prompt is "good."

## Running Tests

```bash
# Validate a refinement output against fixture criteria
scripts/validate-output.sh <output-file.md>
```

## Test Fixtures

Each fixture in `fixtures/` includes:
1. A raw input (the vague developer request)
2. Context about what to test
3. Expected sections in the refined output
4. Validation criteria (checklist of requirements)

### Available Fixtures

| Fixture | Input | Tests |
|---------|-------|-------|
| `vague-dashboard.md` | "make me a dashboard for sales with login and charts" | Full refinement, assumptions, scope, acceptance criteria |
| `incomplete-api.md` | "create an api for uploading files" | Ambiguity handling, missing decisions, multiple interpretations |
| `ambiguous-auth.md` | "add google login" | Auth-specific refinement, OAuth considerations, security |
| `performance-problem.md` | "my api is slow fix it" | Debug profile, diagnosis-first approach, hypotheses |

## Validation Script

`scripts/validate-output.sh` checks:
- All required top-level sections are present
- All refined prompt subsections are present
- Approval gate exists
- Assumptions are explicitly labeled
- Code blocks exist (used in verification commands)

## Adding Test Fixtures

1. Create a new file in `fixtures/your-fixture.md`
2. Follow the existing fixture format:
   - Raw input
   - Context
   - Expected sections
   - Validation criteria (checklist)
3. Add fixture name to the table above

## Limitations

- These tests verify structure, not content quality
- They cannot verify that assumptions are reasonable (only that they exist)
- They cannot verify that acceptance criteria are genuinely testable
- The approval gate is checked for presence, not for proper timing (the agent must self-regulate)
