# Example: Vague Performance Problem

## Input

```
my api is slow fix it
```

## Refinement Output

# Original Request

"my api is slow fix it"

# Understanding

The developer is experiencing performance issues with an API but has provided no specifics: which endpoint is slow, what "slow" means (latency target?), how slow it is, when it started, or under what conditions.

This is a **bug report** that needs the debug profile applied alongside the base protocol.

# Confirmed Requirements

1. The API performance needs improvement
2. The specific endpoint, metrics, and conditions are unknown

# Assumptions

- **Assumption**: "Slow" means response time exceeds acceptable thresholds (likely >1s for user-facing APIs).
- **Assumption**: This is a regression (it used to be faster) rather than a scaling issue (it was always slow).
- **Assumption**: The developer has not yet profiled the API to identify the bottleneck.
- **Assumption**: The API has a database component (most performance issues are database-related).
- **Assumption**: The developer wants the root cause fixed, not just a band-aid.

# Missing Decisions

1. **Which endpoint(s) are slow?** Is it one endpoint or all of them?
2. **What are the current and target response times?** (P50, P95, P99?)
3. **When did the slowness start?** (after a deploy, gradually, always?)
4. **Is it consistent or intermittent?** (always slow, slow under load, slow for certain inputs?)
5. **What is the request volume?** (how many requests per second?)
6. **Are there any recent changes?** (new features, data growth, dependency updates?)
7. **What does the monitoring show?** (APM, logs, error rates?)
8. **Is the database the bottleneck, the application, or external services?**

# Scope

- Diagnose the performance issue
- Identify the root cause
- Propose and implement a fix
- Add performance monitoring if absent
- Prevent regression with tests

# Non-Goals

- Complete performance optimization of the entire API (focus on the reported issue)
- Infrastructure changes (server sizing, CDN, load balancer)
- Full load testing suite (add targeted benchmarks)
- Database migration or schema redesign (unless it's the root cause)
- Rewriting the API in a different language or framework

# Repository Context

> ⚠️ **Repository inspection is CRITICAL for this request.** The developer says "my API" which implies an existing project. Before any analysis can proceed, the repository must be inspected to identify:
>
> - Framework and runtime
> - Database and ORM
> - API routes/endpoints
> - Existing monitoring or logging
> - Recent commits or changes
> - Test infrastructure

# Refined Implementation Prompt

## Objective

Diagnose and fix the performance bottleneck in the API so that response times meet acceptable targets.

## Existing Context

> **Requires immediate repository inspection.** The specific framework, database, and API structure must be identified before analysis can proceed.

## User Stories

- As a **developer**, I want to identify the slow endpoint so that I know what to fix.
- As a **developer**, I want to understand the root cause so that I can fix it properly.
- As a **user**, I want the API to respond quickly so that the application feels responsive.
- As a **team**, I want performance monitoring so that regressions are caught early.

## Functional Requirements

1. Identify the specific endpoint(s) experiencing slowness
2. Profile the endpoint to identify the bottleneck (database, application logic, external calls)
3. Implement a fix for the identified bottleneck
4. Add or update performance tests to prevent regression
5. Document the fix and the monitoring approach

## Technical Constraints

- Fix must not introduce new dependencies without justification
- Fix must not break existing functionality
- Performance target: **To be confirmed** (recommended: P95 < 200ms for standard CRUD, < 500ms for complex queries)
- Database queries should use existing ORM patterns
- Fix should be minimal — address root cause, not symptoms

## Data Requirements

> Depends on the specific bottleneck identified. Common patterns:
>
> - Missing database indexes → add migration
> - N+1 queries → add eager loading or batch queries
> - Unbounded result sets → add pagination
> - Missing cache → add caching layer

## API Requirements

> Depends on the specific endpoint(s) identified as slow.

## UI / UX Requirements

Not applicable — this is an API performance issue.

## Error States

1. **Profiling reveals no bottleneck**: The issue may be environmental (network, client). Document findings.
2. **Fix introduces regression**: All existing tests must continue to pass.
3. **Fix is insufficient**: If the fix doesn't meet the performance target, iterate.

## Empty States

Not applicable.

## Security Requirements

Not applicable for a performance fix — no new security surface introduced.

## Testing Requirements

1. **Benchmark tests** for the affected endpoint(s)
   - Measure response time under typical load
   - Measure response time with realistic data volumes
2. **Regression tests** — all existing tests must pass
3. **Performance test** — verify the fix meets the target

## Acceptance Criteria

1. Given the slow endpoint is identified, when it is profiled, then the bottleneck is clearly identified (database query, N+1, missing index, external call, etc.).
2. Given the root cause is identified, when the fix is implemented, then the endpoint response time meets the target (P95 < confirmed target).
3. Given the fix is applied, when all existing tests are run, then they pass without modification (no regressions).
4. Given the fix is deployed, when the endpoint is monitored, then the improvement is measurable and sustained.
5. Given the issue is resolved, when similar issues arise in the future, then the monitoring in place will catch them.

## Implementation Phases

### Phase 1: Diagnosis
- **Goal**: Identify the slow endpoint and root cause
- **Deliverables**:
  - Repository inspection (framework, database, API routes)
  - Identify the specific slow endpoint(s)
  - Profile the endpoint (database query analysis, application timing, external call timing)
  - Document findings with evidence (query plans, timing data)
- **Done when**: Root cause is identified with supporting evidence

### Phase 2: Fix Implementation
- **Goal**: Resolve the identified bottleneck
- **Deliverables**:
  - Implement the minimal fix (index, query optimization, caching, etc.)
  - Verify the fix with the profiling tools
  - Ensure all existing tests pass
- **Done when**: Performance target is met and tests pass

### Phase 3: Monitoring and Prevention
- **Goal**: Prevent regression
- **Deliverables**:
  - Add or update performance benchmarks
  - Document the issue, root cause, and fix
  - Add monitoring/alerting if not present
- **Done when**: Regression tests are in place and documentation is complete

## Verification Commands

```bash
# Install dependencies (if not already installed)
npm install

# Run existing tests (establish baseline)
npm test

# Profile the API (framework-specific)
# Example for Node.js with clinic.js:
npx clinic doctor -- node app.js

# Example for database query analysis:
npx prisma studio  # inspect queries

# Run tests after fix
npm test

# Run linter
npm run lint

# Run type check
npm run typecheck
```

# Quality Review

| Dimension | Score | Notes |
|-----------|-------|-------|
| Clarity | 2 | The original request provides almost no actionable information. This refinement defines a methodology but requires significant data gathering before implementation can begin. |
| Completeness | 3 | Framework is solid but depends on repository inspection. Cannot define specific fixes without knowing the root cause. |
| Testability | 4 | Acceptance criteria are general but verifiable once the specific endpoint is identified. |
| Technical Feasibility | 4 | Standard performance debugging methodology. Feasible once the specific issue is known. |
| Scope Control | 4 | Focused on the reported issue. Non-goals prevent unnecessary infrastructure changes. |

**Improvements needed:**
1. **Repository inspection is mandatory** — cannot proceed without knowing the framework, database, and API structure.
2. The developer must answer the missing decisions (which endpoint, how slow, when it started) before Phase 1 can begin.
3. Consider recommending APM tooling (Datadog, New Relic, OpenTelemetry) if not already in place.

# Approval

Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
