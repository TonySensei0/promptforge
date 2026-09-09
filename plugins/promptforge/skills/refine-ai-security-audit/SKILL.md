---
name: promptforge-ai-security-audit
description: |
  Comprehensive security audit of a codebase — scans for exposed secrets,
  authentication/authorization flaws, injection vulnerabilities, XSS, insecure
  dependencies, misconfigurations, and AI-generated code vulnerability patterns.
  Produces a structured severity-ranked report. Use with: /promptforge:ai-security-audit
---

# PromptForge: AI Security Audit

You are performing a **comprehensive security audit** of a codebase.

Your purpose is to scan the entire codebase for security vulnerabilities — with special attention to patterns commonly introduced by AI-generated code.

**This is NOT a refinement skill. This is a security scan.**

---

## How to Use

```
/promptforge:ai-security-audit
```

Examples:

```
/promptforge:ai-security-audit
/promptforge:ai-security-audit /path/to/project
```

---

## Canonical Methodology

Read and follow the complete methodology in `_core/profiles/ai-security-audit.md`.

---

## Audit Categories

Execute all 10 categories in order:

1. **Exposed Secrets** — grep for API keys, tokens, passwords, private keys in source code
2. **Authentication & Authorization** — review auth flows, session management, access controls
3. **Injection Vulnerabilities** — SQL, command, LDAP, template injection
4. **Cross-Site Scripting (XSS)** — unescaped user input, missing CSP headers
5. **Sensitive Data Exposure** — PII in logs, error messages, API responses
6. **Security Misconfiguration** — debug mode, security headers, open cloud storage
7. **Broken Cryptography** — weak random values, hardcoded keys, weak algorithms
8. **Insecure Deserialization** — pickle, yaml.load, untrusted data parsing
9. **Dependency Vulnerabilities** — known CVEs, unmaintained packages
10. **AI-Generated Code Red Flags** — characteristic patterns from AI code generation

---

## AI-Generated Code Red Flags

Prioritize checking for these patterns:

- Hardcoded secrets (API keys, tokens, passwords, private keys)
- Missing input validation on user-controlled data
- Weak or missing authentication
- Insecure default configurations
- SQL injection via string concatenation
- XSS via unescaped output
- `Math.random()` for security-sensitive values
- Missing rate limiting
- Overly permissive CORS (`Access-Control-Allow-Origin: *` with credentials)
- Insecure deserialization

---

## Output Format

Produce a structured security audit report:

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
[Each finding with:]
### [SEVERITY] Title
- **Location**: `file:line`
- **Category**: [category]
- **CWE**: [if applicable]
- **OWASP**: [if applicable]
- **Description**: [what and why]
- **Impact**: [exploitation scenario]
- **Evidence**: [code snippet]
- **Remediation**: [specific fix steps]
- **References**: [links]

## Positive Findings
[Things done well]

## Recommendations
[Prioritized list]
```

---

## Quality Self-Assessment

Score the audit (0-5) on: Coverage, Depth, Actionability, Prioritization, False Positive Rate.

---

## Next Step

After the audit, tell the developer:

> **Audit complete.** To fix the issues found, run: `/promptforge:ai-security-fix`
