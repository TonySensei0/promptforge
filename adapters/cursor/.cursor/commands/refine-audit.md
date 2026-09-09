# PromptForge: Refine Audit

Systematically review code for security vulnerabilities, dependency risks, code quality issues, and compliance gaps. Use this when you need a comprehensive code audit.

## Usage

```
PromptForge: Refine Audit
```

Then describe what you want audited:

```
Review the authentication module for security vulnerabilities
Audit all npm dependencies for known CVEs
Check the codebase against OWASP Top 10
Review the payment processing code for PCI compliance
```

## What This Does

This command activates the PromptForge audit methodology, which:

1. **Understands** what you want audited
2. **Classifies** findings by severity (Critical, High, Medium, Low, Info)
3. **Identifies** specific issues with file paths and line references
4. **Provides** actionable remediation steps for each finding
5. **Stops** at an approval gate — does not implement fixes

## Audit Categories

### Code Quality
- Code smells, duplication, dead code
- Design pattern misuse, over-engineering
- Error handling gaps, logging issues

### Security
- OWASP Top 10 vulnerabilities
- Authentication and authorization weaknesses
- Hardcoded secrets, input validation gaps
- Dependency CVEs

### Dependencies
- Outdated packages
- Vulnerable packages
- License compliance issues
- Abandoned packages

### Compliance
- Data handling and retention
- Access controls and least privilege
- Audit trail sufficiency
- GDPR/CCPA considerations

## Output

The refinement produces a structured audit report with:
- Severity-classified findings
- Specific file/line references
- Remediation recommendations
- Implementation phases for fixes
- Quality self-assessment

## After the Audit

Review the findings. Reply with `approve` to begin implementing fixes, or ask for clarifications on specific findings.
