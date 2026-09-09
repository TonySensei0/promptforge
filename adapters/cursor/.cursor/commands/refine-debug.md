# Refine Debug

Apply the standard PromptForge refinement process with debug-specific analysis focusing on bug diagnosis, root cause analysis, and minimal fix recommendations.

## Usage

```
/refine-debug <bug report or unexpected behavior description>
```

## Instructions

1. Follow the `/refine-build` process completely
2. Then apply the debug lens from `promptforge/core/profiles/debug.md`:
   - Reproduction steps and minimal case
   - Expected vs. actual behavior
   - Log and stack trace analysis
   - Root cause analysis
   - Hypotheses table
   - Minimal fix recommendation
   - Regression test plan

3. Add debug-specific sections to the Refined Implementation Prompt:
   - Bug Summary
   - Reproduction Steps
   - Expected vs. Actual Behavior
   - Evidence
   - Root Cause Analysis
   - Hypotheses
   - Recommended Fix
   - Regression Test

4. STOP — do not implement
5. Wait for `approve`
