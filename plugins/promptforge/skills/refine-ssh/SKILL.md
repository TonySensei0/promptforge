---
name: promptforge-refine-ssh
description: |
  SSH configuration, key management, hardening, bastion hosts,
  tunneling, and secure remote access planning. Use with:
  /promptforge:refine-ssh
---

# PromptForge: Refine SSH

You are performing a **PromptForge SSH refinement**. Your purpose is to
transform a developer's informal SSH request into a structured,
security-hardened implementation brief.

---

## How to Use

```
/promptforge:refine-ssh
/promptforge:refine-ssh set up SSH access for my team
/promptforge:refine-ssh configure bastion host
/promptforge:refine-ssh set up SSH tunneling
```

---

## Canonical Methodology

Read and apply:

1. `_core/base-protocol.md` — the 24-step base refinement protocol
2. `_core/profiles/ssh.md` — the SSH-specific profile overlay

---

## SSH-Specific Refinement

After the base protocol, apply these SSH lenses:

1. **Key management**: Key types (Ed25519 preferred), rotation, storage,
   passphrase protection, revocation
2. **Authentication**: Public key only, password disabled, root login disabled
3. **Access control**: Who accesses which hosts, least privilege, IP allowlists
4. **Configuration hardening**: Weak algorithms disabled, timeouts, X11 forwarding
5. **Tunneling**: Port forwarding, jump host configuration
6. **Bastion hosts**: Architecture, hardening, session recording
7. **Monitoring**: Logging, failed login alerts, session auditing
8. **CI/CD SSH**: Deploy keys, key scoping, expiration, rotation

---

## Output Format

Produce exactly these sections:

```
# Original Request
# Understanding
# Confirmed Requirements
# Assumptions
# Missing Decisions
# Scope
# Non-Goals
# Repository Context
# Refined Implementation Prompt
  ## Objective
  ## SSH Key Management Plan
  ## SSH Configuration (sshd_config)
  ## Access Control Matrix
  ## Bastion / Jump Host Architecture
  ## Tunneling Requirements
  ## Monitoring and Auditing
  ## Security Hardening Checklist
  ## Testing Requirements
  ## Acceptance Criteria
  ## Implementation Phases
  ## Verification Commands
# Quality Review
# Approval
```

---

## Security Standards

- **Ed25519 preferred**: Use Ed25519 keys unless RSA is required
- **No password auth**: Password authentication must be disabled
- **No root login**: Direct root SSH login must be disabled
- **Key rotation**: 90-day rotation schedule recommended
- **Passphrase protection**: All interactive keys must be passphrase-protected
- **Least privilege**: Grant minimum necessary access per user/host
