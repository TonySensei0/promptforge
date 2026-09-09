---
name: refine-debug
description: |
  PromptForge debug profile for bug investigation refinements.
  Adds structured diagnosis with reproduction steps, root cause analysis,
  hypotheses, and minimal fix recommendations. Use with: /refine-debug
---

# Refine Debug

Apply the PromptForge base protocol (from `promptforge/core/base-protocol.md`), then overlay the debug-specific analysis from `promptforge/core/profiles/debug.md`.

After the base protocol output, add debug-focused sections:

- Bug Summary
- Reproduction Steps
- Expected vs. Actual Behavior
- Evidence (logs, stack traces)
- Root Cause Analysis
- Hypotheses Table
- Recommended Fix
- Regression Test

All base output sections remain. The Refined Implementation Prompt gets debug-specific structure.

End with: Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
