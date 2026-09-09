# Testing Profile

Use this profile when the request involves test strategy, test automation, coverage planning, or quality assurance.

## Additional Review Focus

Apply the base protocol first. Then apply these testing-specific lenses:

### Test Strategy

- What is the test pyramid distribution (unit/integration/E2E)?
- What testing approach applies (TDD, BDD, test-after)?
- What are the coverage targets (line, branch, integration)?
- What test data strategy is needed (fixtures, factories, mocking)?
- What test environments are needed (local, CI, staging)?

### Unit Testing

- What logic should be unit tested (business logic, pure functions)?
- What should NOT be unit tested (trivial getters, third-party integrations)?
- What is the mocking strategy (what to mock vs. real)?
- What test structure applies (AAA, given-when-then)?
- What edge cases need coverage (boundaries, nulls, errors)?

### Integration Testing

- What API contracts need integration tests?
- What database operations need testing (CRUD, transactions)?
- What external service integrations need contract tests?
- What message queue behaviors need verification?
- What authentication flows need end-to-end testing?

### End-to-End Testing

- What are the critical user journeys to test?
- What browsers and devices must be supported?
- What E2E tooling fits (Playwright, Cypress, Selenium)?
- How is test data managed (seeding, cleanup)?
- How are flaky tests prevented and managed?

### Performance Testing

- What are the expected and peak load scenarios?
- What are the breaking points (stress testing)?
- What are the memory leak risks (soak testing)?
- What benchmarks exist or need to be created?
- How are performance regressions detected?

### Test Infrastructure

- When do tests run in CI/CD (pre-commit, pre-merge, post-deploy)?
- How are coverage reports generated and tracked?
- How are tests parallelized (sharding, resource limits)?
- How are flaky tests detected, quarantined, and fixed?
- What test reporting and dashboards are needed?

## Testing-Specific Open Questions

- What is the minimum acceptable coverage percentage?
- Are there performance test requirements?
- What is the flaky test tolerance?
- How are test environments provisioned?

## Testing-Specific Non-Goals

- What testing is deferred to a later phase?
- What test types are out of scope?
- What environments are not covered?
