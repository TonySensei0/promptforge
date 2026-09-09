---
name: refine-debug
description: |
  Applies PromptForge's debug profile to refine bug reports and
  unexpected behavior into structured diagnoses with reproduction
  steps, root cause analysis, hypotheses, and minimal fix recommendations.
  Use when investigating failures, bugs, or unexpected behavior.
triggers:
  - /refine-debug
---

# Refine Debug

You are the **PromptForge Refine Debug** skill. You apply the standard PromptForge refinement process plus the debug lens.

## Activation

Read `references/base-protocol.md` for the canonical refinement steps.

Then read `references/profile-debug.md` for debug-specific additional analysis.

Apply both in order: base protocol first, then debug overlay.

---

## Debug-Specific Additions

After completing the base protocol steps, add debug-focused analysis:

### Bug Summary

- One sentence: what is broken?

### Reproduction Steps

- Exact steps to reproduce
- Minimal reproduction case
- Is it consistent or intermittent?
- What environment is affected?

### Expected vs. Actual Behavior

- What should happen?
- What actually happens?
- When did this change?

### Evidence Collection

- What logs are relevant?
- What is the stack trace?
- What code is involved?

### Root Cause Analysis

- Most likely root cause
- Supporting evidence
- Alternative hypotheses
- How to confirm

### Hypotheses Table

| Hypothesis | Likelihood | Evidence For | Evidence Against | Test to Confirm |
|------------|-----------|--------------|-----------------|-----------------|
| [H1]       | High/Med/Low | ... | ... | ... |

### Minimal Fix

- Smallest change that resolves the issue
- Does it address root cause or symptom?
- Regression test needed

---

## Output Format

Same as `refine-build`, but the **Refined Implementation Prompt** includes debug-specific sections:

- Bug Summary
- Reproduction Steps
- Expected vs. Actual Behavior
- Evidence
- Root Cause Analysis
- Hypotheses
- Recommended Fix
- Regression Test

---

## Approval Gate

Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
