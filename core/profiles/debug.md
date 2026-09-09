# Debug Profile

Use this profile when the request involves diagnosing a bug, investigating a failure, or understanding unexpected behavior.

## Additional Review Focus

Apply the base protocol first. Then apply these debug-specific lenses:

### Reproduction

- What are the exact steps to reproduce the issue?
- What is the minimal reproduction case?
- Is the issue consistent or intermittent?
- What environment (OS, browser, version) is affected?
- Does the issue occur in development, staging, or production only?
- Is there a workaround?

### Expected vs. Actual Behavior

- What should happen (expected behavior)?
- What actually happens (actual behavior)?
- When did this behavior change?
- What is the diff between working and broken states?
- Is this a regression or has it always been broken?

### Logs

- What log entries are relevant to the issue?
- What log level is needed to capture the failure (debug, info, warn, error)?
- What additional logging would help diagnose this?
- Are logs available for the relevant time period?
- What do the logs show before, during, and after the failure?

### Stack Traces

- What is the full stack trace?
- What is the root frame (where the error originates)?
- What is the top frame (where it surfaces)?
- What is the call chain that leads to the failure?
- Are there any frames from third-party code that are relevant?

### Root Cause Analysis

- What is the most likely root cause?
- What evidence supports this hypothesis?
- What evidence contradicts it?
- What other hypotheses exist?
- How can the root cause be confirmed?
- What is the blast radius (what else is affected)?

### Hypotheses

- List all plausible hypotheses for the failure.
- Rank them by likelihood.
- Identify what evidence would confirm or rule out each hypothesis.
- Identify the cheapest test for each hypothesis.

### Minimal Fix

- What is the smallest change that resolves the issue?
- Does the fix address the root cause or just the symptom?
- What is the risk of the fix causing other issues?
- Can the fix be applied without a broader refactor?
- What regression testing is needed after the fix?

### Regression Testing

- What existing tests should still pass?
- What new test should be added to prevent recurrence?
- How can the reproduction steps be encoded as a test?
- What is the test strategy for verifying the fix?

## Debug-Specific Output Format

When debugging, the refined output should include:

```markdown
## Bug Summary

[One sentence describing the issue]

## Reproduction Steps

1. [Step 1]
2. [Step 2]
...

## Expected Behavior

[What should happen]

## Actual Behavior

[What actually happens]

## Evidence

[Logs, stack traces, screenshots, or relevant code]

## Root Cause Analysis

[Most likely cause with supporting evidence]

## Hypotheses

| Hypothesis | Likelihood | Evidence for | Evidence against | Test to confirm |
|------------|-----------|--------------|-----------------|-----------------|
| [H1]       | High/Med/Low | ... | ... | ... |

## Recommended Fix

[Minimal change to resolve]

## Regression Test

[What test to add]
```

## Debug-Specific Non-Goals

Explicitly state:

- What will not be investigated (unrelated issues)?
- What refactoring is out of scope?
- What root causes are assumed but not verified?
