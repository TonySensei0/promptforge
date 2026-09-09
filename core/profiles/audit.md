# Audit Profile

Use this profile when the request involves auditing code, reviewing security, checking dependencies, or verifying compliance.

## Additional Review Focus

Apply the base protocol first. Then apply these audit-specific lenses:

### Code Quality Audit

- What are the code smells present (duplication, long functions, deep nesting)?
- Are design patterns used appropriately or over-engineered?
- Is naming clear, consistent, and domain-aligned?
- Is there dead code (unused functions, imports, configs)?
- Is error handling proper (no swallowed exceptions)?
- Is logging adequate and free of sensitive data?

### Security Audit

- Does the code follow OWASP Top 10 guidelines?
- Are authentication and authorization checks properly placed?
- Is all user input validated and sanitized?
- Are there any hardcoded secrets or credentials?
- Is cryptography used correctly (proper algorithms, key lengths)?
- Is session management secure?
- Do any dependencies have known CVEs?

### Dependency Audit

- Which dependencies are significantly outdated?
- Which dependencies have known security vulnerabilities?
- Are there license compatibility issues?
- Is the dependency tree bloated with unused packages?
- Are any dependencies unmaintained or abandoned?

### Compliance Checks

- How is PII handled, stored, and protected?
- Are data retention and deletion policies implemented?
- Is access control based on least privilege?
- Is there sufficient audit logging for forensic analysis?
- Does the code meet GDPR/CCPA requirements?
- Are industry standards (SOC 2, PCI DSS, HIPAA) addressed?

### Architecture Audit

- Is there tight coupling or circular dependency?
- Is functionality properly grouped (cohesion)?
- Are SOLID principles followed or intentionally deviated from?
- What technical debt exists and what are the refactoring priorities?
- Where are scalability bottlenecks in the architecture?

## Audit-Specific Open Questions

- What compliance frameworks apply to this project?
- Is there a bug bounty or security disclosure policy?
- Who is the security contact?
- What is the incident response process?
- What is the acceptable risk tolerance for findings?

## Audit-Specific Non-Goals

- What security concerns are deferred to a later phase?
- What compliance work is out of scope?
- What refactoring is not part of this audit?
