---
name: refine-security
description: |
  PromptForge security profile for security-focused refinements.
  Adds analysis of authentication, authorization, input validation, secrets,
  privacy, abuse cases, rate limiting, and security testing. Use with: /refine-security
---

# Refine Security

Apply the PromptForge base protocol (from `promptforge/core/base-protocol.md`), then overlay the security-specific analysis from `promptforge/core/profiles/security.md`.

After the base protocol output, add security-focused sections:

- Authentication Analysis
- Authorization Analysis
- Trust Boundary Mapping
- Input Validation Audit
- Secrets Inventory
- Privacy Assessment
- Abuse Case Analysis
- Dependency Risk
- Security Testing Plan

All base output sections remain. The Refined Implementation Prompt gets security subsections.

End with: Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
