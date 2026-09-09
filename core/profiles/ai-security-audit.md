# AI Security Audit Profile

This profile is applied when the developer runs `/refine-ai-security-audit`.
It does NOT use the base refinement protocol. It is a standalone codebase security scan.

---

## Objective

Perform a comprehensive security audit of the codebase — with special attention to
AI-generated code patterns that commonly introduce vulnerabilities. Produce a
structured report of all findings with severity, location, description, and
remediation guidance.

---

## Audit Scope

Scan the entire codebase including:

- Application source code (all languages and frameworks)
- Configuration files (`.env`, `config.*`, `docker-compose.yml`, etc.)
- Dependency manifests (`package.json`, `requirements.txt`, `Cargo.toml`, etc.)
- Infrastructure-as-code (Terraform, CloudFormation, Dockerfiles)
- API definitions (OpenAPI, GraphQL schemas)
- Database schemas and migrations
- CI/CD pipelines (`.github/workflows/`, `.gitlab-ci.yml`, etc.)

---

## AI-Generated Code Red Flags

AI-generated code has characteristic vulnerability patterns. Prioritize checking for:

| Pattern | Risk | What to Look For |
|---------|------|------------------|
| Hardcoded secrets | Critical | API keys, tokens, passwords, private keys hardcoded in source |
| Missing input validation | High | Direct use of user input without sanitization or validation |
| Weak authentication | Critical | Missing auth checks, hardcoded credentials, weak password policies |
| Insecure defaults | High | Default passwords, open ports, permissive CORS, debug mode in production |
| SQL injection | Critical | String concatenation in queries, missing parameterization |
| XSS vulnerabilities | High | Unescaped user input in HTML/JS, missing Content-Security-Policy |
| Insecure random values | Medium | `Math.random()` for tokens, weak UUID generation |
| Missing rate limiting | Medium | No throttling on login, API, or form submission endpoints |
| Overly permissive CORS | Medium | `Access-Control-Allow-Origin: *` with credentials |
| Insecure deserialization | High | `pickle.loads()`, `yaml.load()`, JSON parsing without validation |
| Path traversal | High | User-controlled file paths without sanitization (`../../../etc/passwd`) |
| Missing HTTPS enforcement | Medium | No HSTS, mixed HTTP/HTTPS content, no secure cookie flags |
| Debug information in production | Medium | Stack traces exposed, verbose error messages, debug endpoints |
| Insecure session management | High | Predictable session IDs, missing session expiry, no rotation |
| Outdated dependencies | Medium-High | Known CVEs in package versions |

---

## Audit Categories

### 1. Exposed Secrets

Scan for secrets committed to the repository:

- API keys (AWS, Google, Stripe, OpenAI, GitHub, etc.)
- Private keys (SSH, PGP, TLS certificates, JWT signing keys)
- Passwords and credentials in source code
- Database connection strings with credentials
- OAuth tokens and refresh tokens
- Cloud provider credentials (AWS keys, GCP service accounts, Azure keys)
- `.env` files committed to version control
- Secrets in comments, debug logs, or error messages
- Secrets in configuration files checked into git

**Detection methods**:
- Grep for patterns: `api_key`, `secret`, `password`, `token`, `private_key`, `-----BEGIN`
- Check `.gitignore` for missing `.env` entries
- Check git history for previously committed secrets
- Review environment variable usage for hardcoded fallbacks

**Severity**: Critical for active keys, High for committed but rotated keys

---

### 2. Authentication and Authorization

- Missing authentication on protected routes/endpoints
- Broken access control (vertical or horizontal privilege escalation)
- Missing authorization checks on API endpoints
- Insecure password storage (plaintext, weak hashing like MD5/SHA1)
- Missing multi-factor authentication where required
- Session fixation vulnerabilities
- Insecure password reset flows
- Missing account lockout after failed login attempts
- JWT vulnerabilities (nonexpiring tokens, weak signing, algorithm confusion)
- OAuth misconfiguration (open redirects, insufficient scope validation)

**Severity**: Critical for broken auth, High for weak auth

---

### 3. Injection Vulnerabilities

- SQL injection (string concatenation in queries)
- Command injection (unsanitized input in shell commands)
- LDAP injection
- XML injection / XXE
- Template injection (SSTI)
- Email header injection
- Header injection (HTTP response splitting)
- NoSQL injection (unvalidated input in MongoDB queries)

**Severity**: Critical for all injection vulnerabilities

---

### 4. Cross-Site Scripting (XSS)

- Reflected XSS (user input reflected in response without encoding)
- Stored XSS (user input stored and rendered without encoding)
- DOM-based XSS (unsafe `innerHTML`, `eval()`, `document.write()`)
- Missing Content-Security-Policy headers
- Unsafe React patterns (`dangerouslySetInnerHTML`)
- Missing output encoding in templates

**Severity**: High for stored XSS, Medium for reflected XSS

---

### 5. Sensitive Data Exposure

- Sensitive data logged to console or log files
- PII transmitted over unencrypted channels
- Sensitive data in error messages
- Missing encryption for sensitive data at rest
- Weak encryption algorithms (DES, RC4, ECB mode)
- Missing encryption for data in transit
- Sensitive data in URLs (query parameters)
- Cache control headers missing on sensitive pages
- Missing data redaction in API responses

**Severity**: High for PII exposure, Medium for logging issues

---

### 6. Security Misconfiguration

- Default credentials still active
- Debug mode enabled in production
- Verbose error messages exposing stack traces
- Missing security headers (CSP, HSTS, X-Frame-Options, X-Content-Type-Options)
- Open S3 buckets, cloud storage, or databases
- Unnecessary services or ports exposed
- Outdated server/framework versions with known CVEs
- Missing CORS configuration or overly permissive CORS
- Directory listing enabled
- `.git` directory accessible via web server
- Missing or weak TLS configuration

**Severity**: High for exposed infrastructure, Medium for missing headers

---

### 7. Broken Cryptography

- Weak random number generation (`Math.random()`, `rand()`)
- Hardcoded encryption keys or IVs
- ECB mode encryption
- MD5 or SHA1 for security purposes
- Missing salt in password hashing
- Weak key lengths (< 2048 bits for RSA, < 256 bits for ECC)
- Insecure key storage (hardcoded, in source control)
- Missing certificate validation
- Weak TLS cipher suites

**Severity**: High for broken crypto in auth, Medium for other uses

---

### 8. Insecure Deserialization

- `pickle.loads()` / `yaml.load()` without SafeLoader
- JSON parsing without schema validation
- Deserializing untrusted data
- PHP unserialize() with user input
- Java ObjectInputStream with untrusted data
- Insecure XML parsing (XXE via external entities)

**Severity**: High for remote code execution risk, Medium for data tampering

---

### 9. Dependency Vulnerabilities

- Packages with known CVEs
- Unmaintained packages (no updates in 12+ months)
- Packages with known malware
- Transitive dependencies with vulnerabilities
- Lock file not committed (non-deterministic builds)
- Using alpha/beta packages in production
- Missing integrity checks (no lock file, no hash verification)

**Severity**: Critical for actively exploited CVEs, High for other CVEs, Low for unmaintained

---

### 10. Insecure Direct Object References (IDOR)

- User-controllable IDs in API endpoints without authorization checks
- Sequential IDs exposing total record count
- Missing ownership validation on resource access
- File path traversal via user-controlled filenames
- Missing access control on REST API resources

**Severity**: High for PII access, Medium for other data

---

## Output Format

Produce the audit report in this exact structure:

```markdown
# Security Audit Report

**Codebase**: [project name]
**Date**: [ISO date]
**Auditor**: PromptForge AI Security Audit
**Overall Risk Level**: [Critical / High / Medium / Low]

## Executive Summary

[2-3 sentences summarizing the overall security posture and top risks]

## Severity Summary

| Severity | Count |
|----------|-------|
| 🔴 Critical | N |
| 🟠 High | N |
| 🟡 Medium | N |
| 🔵 Low | N |

## Findings

### 🔴 [CRITICAL] Finding Title

**Location**: `file/path.ext:line_number`
**Category**: [e.g., Exposed Secrets, Injection, Auth Bypass]
**CWE**: [CWE identifier if applicable, e.g., CWE-798]
**OWASP**: [A01:2021 – Broken Access Control]

**Description**:
[What the vulnerability is and why it matters]

**Impact**:
[What could happen if exploited]

**Evidence**:
[Code snippet showing the vulnerable code]

**Remediation**:
[Specific steps to fix this issue]

**References**:
[Links to CWE, OWASP, or relevant documentation]

---

### 🟠 [HIGH] Finding Title
[same structure]

### 🟡 [MEDIUM] Finding Title
[same structure]

### 🔵 [LOW] Finding Title
[same structure]

## Positive Findings

[Things the codebase does well from a security perspective — important for morale and to avoid false positives on re-audit]

## Recommendations

[Prioritized list of actions the team should take, beyond individual fixes]

## Appendix: Tools Used

[List the scanning approaches used: grep patterns, manual review, dependency check, etc.]
```

---

## Severity Definitions

| Severity | Meaning | Response Time |
|----------|---------|---------------|
| 🔴 **Critical** | Immediate exploitation risk, data breach, or full system compromise | Fix within 24 hours |
| 🟠 **High** | Significant security weakness that could lead to compromise | Fix within 1 week |
| 🟡 **Medium** | Security gap that increases attack surface but requires additional conditions to exploit | Fix within 1 month |
| 🔵 **Low** | Best practice violation or minor hardening opportunity | Fix in next sprint |

---

## Audit Process

Execute these steps in order:

1. **Scan for secrets** — grep for API keys, tokens, passwords, private keys
2. **Check authentication** — review all auth flows, session management, password handling
3. **Check authorization** — verify access controls on all protected resources
4. **Check injection points** — review all user input handling in queries, commands, templates
5. **Check XSS vectors** — review all output rendering of user input
6. **Check data exposure** — review logging, error messages, API responses for sensitive data
7. **Check configuration** — review security headers, CORS, TLS, debug mode, cloud storage
8. **Check cryptography** — review encryption, random values, key management
9. **Check dependencies** — scan for known CVEs, unmaintained packages
10. **Check for AI-generated patterns** — look for the characteristic vulnerabilities listed above
11. **Produce report** — format findings in the standard report structure

---

## Quality Self-Assessment

Score the audit on these dimensions (0-5):

1. **Coverage**: Did the audit check all categories?
2. **Depth**: Were findings specific with file paths and line numbers?
3. **Actionability**: Can a developer fix each finding from the report alone?
4. **Prioritization**: Are critical issues clearly distinguished from low-priority ones?
5. **False Positive Rate**: Were findings validated (not just grep matches)?

Any score below 4 requires explanation.
