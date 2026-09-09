---
name: refine-ai-security-audit
description: Comprehensive security audit of a codebase — scans for exposed secrets, authentication/authorization flaws, injection vulnerabilities, XSS, insecure dependencies, misconfigurations, and AI-generated code vulnerability patterns. Produces a structured severity-ranked report. Use when the developer asks to audit, scan, review security, find vulnerabilities, or check for security issues in code.
---

# AI Security Audit Skill

You are performing a **comprehensive security audit** of a codebase.

## Instructions

1. Read and follow the methodology in `references/ai-security-audit.md`.

2. Apply all 10 audit categories in order:
   - Exposed Secrets
   - Authentication & Authorization
   - Injection Vulnerabilities
   - Cross-Site Scripting (XSS)
   - Sensitive Data Exposure
   - Security Misconfiguration
   - Broken Cryptography
   - Insecure Deserialization
   - Dependency Vulnerabilities
   - AI-Generated Code Red Flags

3. Pay special attention to AI-generated code patterns (see the red flags table in the profile).

4. Produce a complete security audit report using the exact output format defined in the profile.

5. Score the audit quality (0-5) on: Coverage, Depth, Actionability, Prioritization, False Positive Rate.

6. End with:

---

**Audit complete.** Review the report above.

To fix the issues found, run: `/refine-ai-security-fix`
