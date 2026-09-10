---
name: promptforge-ai-security-fix
description: |
  Fix vulnerabilities from a security audit report — structured fix
  instructions for each finding, grouped by severity (Critical → High →
  Medium → Low). Use after /promptforge:ai-security-audit, or when the
  developer pastes a security audit report and asks to fix issues.
---

# PromptForge: AI Security Fix

You are generating **fix instructions** for a security audit report.

**This is NOT a refinement skill. This is a fix-planning skill.**

---

## How to Use

```
/promptforge:ai-security-fix
/promptforge:ai-security-fix [paste audit report here]
```

---

## Canonical Methodology

Read and follow the complete methodology in `_core/profiles/ai-security-fix.md`.

---

## Workflow

1. If no audit report is provided, instruct the developer to run `/promptforge:ai-security-audit` first.
2. Read and apply the methodology from `_core/profiles/ai-security-fix.md`.
3. Process findings in priority order: Critical → High → Medium → Low.
4. For each finding, produce:
   - Current vulnerable code snippet
   - Fixed code snippet
   - Explanation of why the fix works
   - Additional actions needed (rotate secrets, update deps, etc.)
   - Verification steps
5. Group multiple findings of the same category as batch fixes.
6. Score the fix plan (0-5) on: Completeness, Correctness, Actionability, Priority, Verification.

---

## Output Format

```
# Security Fix Plan

**Source Audit**: [report reference or date]
**Total Findings**: N (Critical: N, High: N, Medium: N, Low: N)

## Fix Summary

| Severity | Count | Fixed | Remaining |
|----------|-------|-------|-----------|
| 🔴 Critical | N | N | N |
| 🟠 High | N | N | N |
| 🟡 Medium | N | N | N |
| 🔵 Low | N | N | N |

## Phase 1: Critical Fixes
[Each finding with code, fix, explanation, verification]

## Phase 2: High-Priority Fixes
...

## Phase 3: Medium Fixes
...

## Phase 4: Low Fixes
...

## Prevention Recommendations
[How to avoid similar issues in the future]
```

---

## After Fixes

Tell the developer:

> **Fix plan complete.** Apply fixes in order (Critical → High → Medium → Low).
> After applying fixes, re-run: `/promptforge:ai-security-audit` to verify.
