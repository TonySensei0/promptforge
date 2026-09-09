---
name: ai-security-fix
description: Fix vulnerabilities found in a security audit report. Takes a PromptForge security audit report as input and produces structured, implementation-ready fix instructions for each finding, grouped by severity. Use after running ai-security-audit, or when the developer pastes a security audit report and asks to fix the issues.
---

Generate fix instructions for a security audit report.

**Instructions**:

1. Read promptforge/core/profiles/ai-security-fix.md for the complete methodology.

2. If no audit report is provided, instruct the developer to run `ai-security-audit` first.

3. Process findings in priority order: Critical → High → Medium → Low.

4. For each finding, produce:
   - **Current Code**: The vulnerable code snippet
   - **Fixed Code**: The corrected code snippet
   - **Explanation**: Why this fix resolves the vulnerability
   - **Additional Actions**: Rotate secrets, update dependencies, add tests
   - **Verification**: Steps to confirm the fix works

5. Group multiple findings of the same category as batch fixes with a shared template.

6. At the end, provide:
   - Fix summary table (total/fixed/remaining per severity)
   - Implementation order checklist
   - Verification steps
   - Prevention recommendations (pre-commit hooks, CI gates, dependency monitoring)

7. Score the fix plan (0-5) on: Completeness, Correctness, Actionability, Priority, Verification. Explain any score below 4.

End with:

---

**Fix plan complete.** Apply fixes in the order listed above (Critical → High → Medium → Low).

After applying fixes, re-run: `ai-security-audit` to verify.
