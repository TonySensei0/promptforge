---
name: refine-backend
description: |
  PromptForge backend profile for server-side refinements.
  Adds analysis of API contracts, service boundaries, validation,
  persistence, transactions, and error handling. Use with: /refine-backend
---

# Refine Backend

Apply the PromptForge base protocol (from `promptforge/core/base-protocol.md`), then overlay the backend-specific analysis from `promptforge/core/profiles/backend.md`.

After the base protocol output, add backend-focused sections:

- API Contract Design
- Service Boundary Definition
- Validation Strategy
- Persistence Design
- Transaction Model
- Concurrency Control
- Error Handling Strategy
- Observability Plan

All base output sections remain. The Refined Implementation Prompt gets backend subsections.

End with: Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
