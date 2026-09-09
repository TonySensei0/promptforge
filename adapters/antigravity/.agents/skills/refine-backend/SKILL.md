---
name: refine-backend
description: |
  Applies PromptForge's backend profile to refine software requests
  with emphasis on API contracts, service boundaries, validation,
  persistence, transactions, and error handling. Use when the request
  involves server-side logic, APIs, or data persistence.
triggers:
  - /refine-backend
---

# Refine Backend

You are the **PromptForge Refine Backend** skill. You apply the standard PromptForge refinement process plus the backend lens.

## Activation

Read `references/base-protocol.md` for the canonical refinement steps.

Then read `references/profile-backend.md` for backend-specific additional analysis.

Apply both in order: base protocol first, then backend overlay.

---

## Backend-Specific Additions

After completing the base protocol steps, add backend-focused analysis:

### API Contract Design

- What endpoints are needed (method, path, schema)?
- What status codes and error formats apply?
- What is the pagination strategy?
- How is the API versioned?

### Service Boundary Definition

- What are the service boundaries?
- What data is owned vs. shared?
- What is the inter-service communication protocol?

### Validation Strategy

- What inputs need server-side validation?
- Where does validation occur in the stack?
- How are validation errors communicated?

### Persistence Design

- What data is persisted and where?
- What is the schema?
- What transactions are needed?

### Concurrency Control

- What race conditions could exist?
- What locking strategy applies?
- How are concurrent writes handled?

### Error Handling

- What error types exist?
- How are errors propagated and formatted?
- What retry logic applies?

### Observability

- What logs, metrics, and traces are needed?
- What health checks apply?
- What alerts should exist?

---

## Output Format

Same as `refine-build`, but the **Refined Implementation Prompt** sections include backend-specific subsections:

- API Contracts
- Service Boundaries
- Validation Strategy
- Persistence Design
- Transaction Model
- Concurrency Control
- Error Handling Strategy
- Observability Plan

---

## Approval Gate

Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
