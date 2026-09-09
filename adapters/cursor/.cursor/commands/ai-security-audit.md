# AI Security Audit

Perform a comprehensive security audit of the codebase.

**Instructions**:

1. Read `promptforge/core/profiles/ai-security-audit.md` for the complete methodology.

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
   - AI-Generated Code Red Flags — hardcoded secrets, missing validation, weak auth

3. Pay special attention to AI-generated code patterns (see the profile for the full red flags table).

4. Produce a complete security audit report using the output format defined in the profile.

5. Score the audit quality (0-5) on: Coverage, Depth, Actionability, Prioritization, False Positive Rate.

End with: "Audit complete. To fix issues, use: PromptForge: AI Security Fix"
