# Security Profile

Use this profile when the request involves authentication, authorization, data handling, or any security-relevant feature.

## Additional Review Focus

Apply the base protocol first. Then apply these security-specific lenses:

### Authentication

- How do users prove their identity?
- What authentication methods are used (password, OAuth, SSO, MFA, passkeys)?
- How are credentials stored and transmitted?
- What is the session management strategy?
- How are expired or compromised credentials handled?

### Authorization

- What permissions or roles exist?
- How is access control enforced (RBAC, ABAC, ACL)?
- Where are the authorization checks?
- Can users escalate privileges?
- How are permission changes audited?

### Trust Boundaries

- Where does data cross a trust boundary (user → app, app → API, app → database)?
- What validation occurs at each boundary?
- What is trusted vs. untrusted input?
- Where does data from external systems enter?

### Input Validation

- What inputs are accepted from users or external systems?
- How is each input validated?
- What injection vectors exist (SQL, NoSQL, XSS, command injection, SSRF)?
- How are malformed inputs handled?
- What sanitization or encoding is applied?

### Secrets Management

- What secrets does the system handle (API keys, tokens, passwords, certificates)?
- How are secrets stored?
- How are secrets rotated?
- Are any secrets logged or exposed in errors?
- What is the blast radius if a secret is compromised?

### Privacy

- What personal data is collected or stored?
- What is the data retention policy?
- How is data deleted or anonymized?
- What is the GDPR/CCPA/regional compliance impact?
- Are there data minimization concerns?

### Abuse Cases

- How can this feature be misused?
- What rate limiting is needed?
- What abuse detection is needed?
- How are abusive actors identified and handled?
- What is the escalation path for abuse?

### Rate Limiting

- What endpoints or actions need rate limiting?
- What are the rate limits?
- What happens when limits are exceeded?
- Are there different limits per user tier or role?

### Dependency Risk

- What new dependencies does this feature introduce?
- Are the dependencies actively maintained?
- Do they have known vulnerabilities?
- What is the supply chain risk?
- Are there lighter alternatives?

### Audit Logging

- What security-relevant events need logging?
- What information is captured in each log entry?
- How long are logs retained?
- Who has access to logs?
- Can logs be tampered with?

### Security Testing

- What security tests are needed?
- Are there specific threat models to address?
- What penetration testing scope is relevant?
- What SAST/DAST tooling applies?

## Security-Specific Open Questions

Add these questions when relevant:

- What compliance frameworks apply (SOC 2, HIPAA, PCI DSS, etc.)?
- Is there a bug bounty or security disclosure policy?
- Who is the security contact for this project?
- What is the incident response process?

## Security-Specific Non-Goals

Explicitly state:

- What security concerns are out of scope for this phase?
- What compliance work is deferred?
- What security testing is planned for a later phase?
