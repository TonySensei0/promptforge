---
name: ai-security-audit
description: Comprehensive security audit of a codebase — scans for exposed secrets, authentication/authorization flaws, injection vulnerabilities, XSS, insecure dependencies, misconfigurations, and AI-generated code vulnerability patterns. Produces a structured severity-ranked report. Use when the developer asks to audit, scan, review security, find vulnerabilities, or check for security issues in code.
---

Perform a comprehensive security audit of the codebase.

**Instructions**:

1. Read promptforge/core/profiles/ai-security-audit.md for the complete methodology.

2. Apply all 10 audit categories in order:
   - Exposed Secrets — grep for API keys, tokens, passwords, private keys in source
   - Authentication & Authorization — review auth flows, session management, access controls
   - Injection Vulnerabilities — SQL, command, LDAP, template injection patterns
   - Cross-Site Scripting (XSS) — unescaped user input, missing CSP headers
   - Sensitive Data Exposure — PII in logs, error messages, API responses
   - Security Misconfiguration — debug mode, security headers, open cloud storage
   - Broken Cryptography — weak random values, hardcoded keys, weak algorithms
   - Insecure Deserialization — pickle, yaml.load, untrusted data parsing
   - Dependency Vulnerabilities — known CVEs, unmaintained packages
   - AI-Generated Code Red Flags — hardcoded secrets, missing validation, weak auth, insecure defaults

3. Pay special attention to AI-generated code patterns:
   - Hardcoded secrets (API keys, tokens, passwords, private keys)
   - Missing input validation on user-controlled data
   - Weak or missing authentication
   - Insecure default configurations
   - SQL injection via string concatenation
   - XSS via unescaped output
   - `Math.random()` for security-sensitive values
   - Missing rate limiting
   - Overly permissive CORS

4. Produce a complete security audit report using this format:

```
# Security Audit Report

**Codebase**: [name]
**Date**: [ISO date]
**Auditor**: PromptForge AI Security Audit
**Overall Risk Level**: [Critical / High / Medium / Low]

## Executive Summary
[2-3 sentences]

## Severity Summary
| Severity | Count |
|----------|-------|
| 🔴 Critical | N |
| 🟠 High | N |
| 🟡 Medium | N |
| 🔵 Low | N |

## Findings
[For each finding:]
### 🔴 [CRITICAL] Title
- **Location**: `file:line`
- **Category**: [category]
- **CWE**: [if applicable]
- **OWASP**: [if applicable]
- **Description**: [what it is and why it matters]
- **Impact**: [what could happen]
- **Evidence**: [vulnerable code snippet]
- **Remediation**: [specific fix steps]
- **References**: [CWE/OWASP links]

[Repeat for each finding in order: Critical → High → Medium → Low]

## Positive Findings
[Things done well]

## Recommendations
[Prioritized list of actions]
```

5. Score the audit quality (0-5) on: Coverage, Depth, Actionability, Prioritization, False Positive Rate. Explain any score below 4.

End with:

---

**Audit complete.** Review the report above.

To fix the issues found, use: `ai-security-fix`
