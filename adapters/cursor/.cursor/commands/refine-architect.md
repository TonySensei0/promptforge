# Refine Architect

Apply the standard PromptForge refinement process with architect-specific analysis focusing on system boundaries, components, data flow, scalability, failure modes, and architecture tradeoffs.

## Usage

```
/refine-architect <your request>
```

## Instructions

1. Follow the `/refine-build` process completely
2. Then apply the architect lens from `promptforge/core/profiles/architect.md`:
   - System boundaries and trust boundaries
   - Component responsibilities and architecture
   - Data flow and hot paths
   - Scalability assessment
   - Failure mode analysis
   - Architecture tradeoffs
   - Observability requirements

3. Add architect-specific sections to the Refined Implementation Prompt:
   - System Boundaries
   - Component Architecture
   - Data Flow
   - Scalability Considerations
   - Failure Modes
   - Architecture Tradeoffs
   - Observability

4. STOP — do not implement
5. Wait for `approve`
