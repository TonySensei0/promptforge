---
name: refine-architect
description: |
  PromptForge architect profile for system design refinements.
  Adds analysis of system boundaries, components, data flow, scalability,
  failure modes, and architecture tradeoffs. Use with: /refine-architect
---

# Refine Architect

Apply the PromptForge base protocol (from `promptforge/core/base-protocol.md`), then overlay the architect-specific analysis from `promptforge/core/profiles/architect.md`.

After the base protocol output, add:

- System Boundaries Analysis
- Component Architecture
- Data Flow
- Scalability Assessment
- Failure Mode Analysis
- Architecture Tradeoffs
- Observability Requirements

All base output sections remain. The Refined Implementation Prompt gets architect subsections.

End with: Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
