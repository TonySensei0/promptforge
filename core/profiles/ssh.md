# SSH Profile

Use this profile when the request involves SSH configuration, SSH key management,
SSH tunneling, bastion hosts, or any feature requiring secure shell access.

## Additional Review Focus

Apply the base protocol first. Then apply these SSH-specific lenses:

### SSH Key Management

- What key types are used (Ed25519, RSA, ECDSA)?
- What is the key rotation policy?
- How are private keys stored and protected?
- Are keys passphrase-protected?
- How are revoked keys handled?
- Is there a centralized key management system?
- What is the key backup and recovery strategy?

### SSH Authentication

- What authentication methods are allowed (public key, password, keyboard-interactive)?
- Is password authentication disabled?
- Is root login disabled?
- Are certificate-based auth options considered?
- What is the MFA strategy for SSH access?
- How are bastion hosts authenticated?

### SSH Access Control

- Who has SSH access and to which hosts?
- What is the least-privilege model?
- Are there IP allowlists or VPN requirements?
- How is access provisioned and deprovisioned?
- What audit trail exists for SSH sessions?
- Are there time-based access restrictions?

### SSH Configuration Hardening

- Are weak algorithms disabled (DSA, RSA < 2048, CBC mode)?
- Is `PermitRootLogin` set to `no`?
- Is `PasswordAuthentication` set to `no`?
- Are idle sessions timed out (`ClientAliveInterval`, `ClientAliveCountMax`)?
- Is `X11Forwarding` disabled unless needed?
- Are `AllowUsers`/`AllowGroups` configured?
- Is `PubkeyAuthentication` enforced?

### SSH Tunneling and Port Forwarding

- What port forwarding is allowed (local, remote, dynamic)?
- Are tunnels restricted to specific users or groups?
- Is there monitoring for tunnel abuse?
- Are jump hosts properly configured?
- How are tunnel credentials managed?

### Bastion Hosts

- Is there a bastion/jump host architecture?
- How are bastion hosts hardened?
- Is there logging of all sessions through the bastion?
- How are bastion host credentials managed?
- Is there multi-factor auth for bastion access?
- What is the bastion host patching strategy?

### SSH Monitoring and Auditing

- Is SSH access logged (auth.log, journalctl)?
- Are failed login attempts monitored and alerted?
- Is there session recording (ttyrec, tlog)?
- How long are SSH logs retained?
- Are logs protected from tampering?
- Is there real-time alerting on suspicious SSH patterns?

### SSH in CI/CD and Automation

- How are SSH keys stored in CI/CD systems?
- Are deploy keys used instead of personal keys?
- Are SSH keys scoped to specific repositories/hosts?
- Is there an expiration on automated SSH keys?
- How are SSH keys rotated in automation pipelines?

## SSH-Specific Open Questions

- What compliance requirements apply to remote access (SOC 2, HIPAA, PCI DSS)?
- Is there an incident response plan for compromised SSH keys?
- Are SSH sessions recorded for compliance?
- What is the recovery process if a bastion host is compromised?
- Are there geographic restrictions on SSH access?

## SSH-Specific Non-Goals

- What SSH features are deferred to a later phase?
- Is legacy SSH protocol (v1) support explicitly excluded?
- Are certain tunneling use cases out of scope?
