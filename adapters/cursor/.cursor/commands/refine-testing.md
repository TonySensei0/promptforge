# PromptForge: Refine Testing

Design a comprehensive test strategy for any feature or codebase. Plan unit tests, integration tests, E2E tests, and performance tests before writing any test code.

## Usage

```
PromptForge: Refine Testing
```

Then describe what you want a test strategy for:

```
Design a test strategy for the checkout flow
Plan test coverage for the new REST API endpoints
Set up CI testing for the React frontend
```

## What This Does

This command activates the PromptForge testing methodology, which:

1. **Understands** the feature or codebase to test
2. **Designs** a test pyramid (unit, integration, E2E)
3. **Plans** specific test cases for each layer
4. **Defines** coverage targets and CI integration
5. **Stops** at an approval gate — does not write test code

## Test Strategy

### Unit Tests
- What logic to test (and what NOT to test)
- Mocking strategy
- Test structure (Arrange-Act-Assert)
- Edge cases and boundary values

### Integration Tests
- API contract validation
- Database CRUD operations
- External service interactions
- Authentication flows

### End-to-End Tests
- Critical user journeys
- Browser compatibility
- Test data management
- Flake prevention

### Performance Tests
- Load testing scenarios
- Stress testing and breaking points
- Soak testing for memory leaks
- Benchmarking and regression detection

## Output

The refinement produces a structured test plan with:
- Test pyramid distribution
- Specific test cases per component
- Coverage targets
- CI/CD integration plan
- Test infrastructure requirements

## After the Plan

Review the test strategy. Reply with `approve` to begin implementing tests, or ask for modifications.
