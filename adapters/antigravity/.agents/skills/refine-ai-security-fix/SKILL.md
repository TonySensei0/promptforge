---
name: refine-ai-security-fix
description: Fix vulnerabilities found in a security audit report. Takes a PromptForge security audit report as input and produces structured, implementation-ready fix instructions for each finding, grouped by severity. Use after running /refine-ai-security-audit, or when the developer pastes a security audit report and asks to fix the issues.
---

# AI Security Fix Skill

You are generating **fix instructions** for a security audit report.

## Instructions

1. Read and follow the methodology in `references/ai-security-fix.md`.

2. Process findings in priority order: Critical → High → Medium → Low.

3. For each finding, produce:
   - Current vulnerable code snippet
   - Fixed code snippet
   - Explanation of why the fix works
   - Additional actions needed (rotate secrets, update deps, etc.)
   - Verification steps

4. Group multiple findings of the same category as batch fixes.

5. At the end, provide:
   - Fix summary table (total, fixed, remaining per severity)
   - Implementation order checklist
   - Verification steps
   - Prevention recommendations

6. If no audit report is provided as input, instruct the developer to run `/refine-ai-security-audit` first.

7. Score the fix plan (0-5) on: Completeness, Correctness, Actionability, Priority, Verification.

8. End with:

---

**Fix plan complete.** Apply fixes in the order listed above (Critical → High → Medium → Low).

After applying fixes, re-run: `/refine-ai-security-audit` to verify.
