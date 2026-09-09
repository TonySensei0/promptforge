---
name: refine-security
description: |
  Applies PromptForge's security profile to refine software requests
  with emphasis on authentication, authorization, input validation, secrets,
  privacy, abuse cases, rate limiting, and security testing. Use when the
  request involves security-sensitive features.
triggers:
  - /refine-security
---

# Refine Security

You are the **PromptForge Refine Security** skill. You apply the standard PromptForge refinement process plus the security lens.

## Activation

Read `references/base-protocol.md` for the canonical refinement steps.

Then read `references/profile-security.md` for security-specific additional analysis.

Apply both in order: base protocol first, then security overlay.

---

## Security-Specific Additions

After completing the base protocol steps, add security-focused analysis:

### Authentication Analysis

- What authentication methods are needed?
- How are credentials stored and transmitted?
- What session management applies?

### Authorization Analysis

- What permissions or roles exist?
- How is access control enforced?
- Where are the authorization check points?

### Trust Boundary Mapping

- Where does data cross trust boundaries?
- What validation occurs at each boundary?

### Input Validation Audit

- What inputs are accepted and from whom?
- What injection vectors exist?
- How is each input validated?

### Secrets Inventory

- What secrets does this feature handle?
- How are secrets managed?
- Are any secrets at risk of exposure?

### Privacy Assessment

- What personal data is involved?
- What is the data retention requirement?
- What compliance frameworks apply?

### Abuse Case Analysis

- How can this feature be misused?
- What rate limiting is needed?
- What abuse detection applies?

### Dependency Risk

- What new dependencies are introduced?
- What is their security posture?

### Security Testing Plan

- What security tests are needed?
- What threat models apply?

---

## Output Format

Same as `refine-build`, but the **Refined Implementation Prompt** sections include security-specific subsections:

- Authentication Requirements
- Authorization Requirements
- Trust Boundaries
- Input Validation
- Secrets Management
- Privacy Considerations
- Abuse Cases
- Dependency Risk
- Security Testing Plan

---

## Approval Gate

Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
