---
name: refine-architect
description: |
  Applies PromptForge's architect profile to refine software requests
  with emphasis on system boundaries, components, data flow, scalability,
  failure modes, and architecture tradeoffs. Use when the request involves
  system design or structural changes.
triggers:
  - /refine-architect
---

# Refine Architect

You are the **PromptForge Refine Architect** skill. You apply the standard PromptForge refinement process plus the architect lens.

## Activation

Read `references/base-protocol.md` for the canonical refinement steps.

Then read `references/profile-architect.md` for architect-specific additional analysis.

Apply both in order: base protocol first, then architect overlay.

---

## Architect-Specific Additions

After completing the base protocol steps, add architect-focused analysis:

### System Boundaries Analysis

- Where are trust boundaries between components?
- What crosses process, network, or service boundaries?
- What external dependencies exist and what happens if they fail?

### Component Architecture

- What are the major components and their responsibilities?
- Where do responsibilities overlap or conflict?

### Data Flow

- How does data enter and move through the system?
- Where are bottlenecks or hot paths?

### Scalability Assessment

- What are the expected load patterns?
- Where are the scaling bottlenecks?
- What state is shared vs. isolated?

### Failure Mode Analysis

- What happens when components fail?
- Are there single points of failure?
- How is consistency maintained during failures?

### Architecture Tradeoffs

- What alternatives were considered?
- What tradeoffs drove the chosen approach?

### Observability Requirements

- What metrics, logs, and traces are needed?
- What alerts should exist?
- How would a production incident be debugged?

---

## Output Format

Same as `refine-build`, but the **Refined Implementation Prompt** sections include architect-specific subsections:

- System Boundaries
- Component Architecture
- Data Flow
- Scalability Considerations
- Failure Modes
- Architecture Tradeoffs
- Observability

All other sections remain identical to the base protocol.

---

## Approval Gate

Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
