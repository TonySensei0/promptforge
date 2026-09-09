# AI Security Fix

Generate fix instructions for a security audit report.

**Instructions**:

1. Read `promptforge/core/profiles/ai-security-fix.md` for the complete methodology.

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
   - Prevention recommendations

7. Score the fix plan (0-5) on: Completeness, Correctness, Actionability, Priority, Verification.

End with: "Fix plan complete. Apply fixes in order (Critical → High → Medium → Low), then re-run: PromptForge: AI Security Audit"
