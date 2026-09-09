# PromptForge Base Protocol

This is the canonical refinement process that all adapters and profiles follow.

No implementation occurs during refinement. The protocol stops at an approval gate.

---

## Refinement Steps

Execute these steps in order. Do not skip any step.

### 1. Understand the Raw Request

- Read the developer's request verbatim.
- Do not paraphrase yet. Just restate what was actually said.
- Flag jargon, vague terms, and implied assumptions.

### 2. Restate the Intended Outcome

- In your own words, describe what success looks like.
- If the request is ambiguous, present multiple interpretations.
- Do not commit to one interpretation if multiple reasonable ones exist.

### 3. Identify Likely Users and Roles

- Who interacts with this system?
- What permissions or roles do they have?
- Are there external users, internal users, admins, APIs?

### 4. Extract Explicit Requirements

- List requirements that are directly stated in the request.
- These are "confirmed requirements."
- Do not infer or expand beyond what was explicitly asked.

### 5. Infer Reasonable Requirements

- Based on the explicit requirements, identify what is typically needed.
- Mark these as **assumptions**, not confirmed requirements.
- Example: "Login is requested → assumption: password reset is needed."

### 6. Label Assumptions Explicitly

- Every assumption must be clearly labeled as an assumption.
- Never silently invent critical requirements.
- Distinguish between:
  - **Confirmed**: directly stated in the request
  - **Assumed**: reasonable inference, labeled as such
  - **Open**: unknown, needs developer input

### 7. Identify Missing Information

- What cannot be determined from the request?
- What would materially change the implementation?
- Present these as **open questions** to the developer.

### 8. Define Scope

- What is included in this work?
- What boundaries define "done"?
- Be explicit. Vague scope causes scope creep.

### 9. Define Non-Goals

- What is explicitly out of scope?
- What will NOT be built?
- What existing systems will NOT be replaced?

### 10. Inspect Repository Context (When Relevant)

If the request concerns the current repository:

- Read the project structure.
- Identify the framework, runtime, and package manager.
- Identify existing authentication, database, and API patterns.
- Identify existing UI components and conventions.
- Identify the test framework and CI configuration.
- Prefer existing patterns over introducing new ones.
- Do not invent architecture when the repository already has a clear pattern.

If the request is for a new project (no existing repository), skip to step 14.

### 11. Identify Framework / Runtime / Package Manager

- State the detected or recommended stack.
- Justify each choice when a choice exists.
- Do not recommend switching stacks without a compelling reason.

### 12. Identify Database / Authentication / API / Test Setup

- What data persistence is needed?
- What authentication exists or should be added?
- What API patterns exist?
- What test infrastructure exists?

### 13. Reuse Existing Architecture Where Possible

- Map new requirements onto existing code.
- Identify extension points.
- Avoid duplicating functionality that already exists.
- Flag where new code would conflict with existing patterns.

### 14. Identify Edge Cases

- What happens at boundaries?
- What happens when data is empty, missing, or malformed?
- What happens under concurrent access?
- What happens when external services fail?

### 15. Identify Error States

- What can fail?
- How should each failure be communicated to the user?
- What retry or recovery mechanisms are needed?
- How are errors logged?

### 16. Identify Security / Privacy Considerations

- What trust boundaries exist?
- What input needs validation?
- What data is sensitive?
- What authentication and authorization is needed?
- What rate limiting or abuse prevention is needed?
- What secrets management is required?

### 17. Define Testing Requirements

- What must be tested?
- What test types are needed (unit, integration, e2e)?
- What test data or fixtures are needed?
- What coverage is reasonable?

### 18. Create Testable Acceptance Criteria

Each criterion must be:

- **Specific**: no ambiguous language like "user-friendly" or "performant"
- **Verifiable**: can be checked by a test or inspection
- **Independent**: each criterion stands alone

Good example:

> "When no records exist for the selected date range, display an explicit empty state with a message and an action button, instead of rendering a chart with zero-value bars."

Bad example:

> "The UI should be user friendly."

### 19. Define Implementation Phases

Break the work into ordered phases:

- **Phase 1**: Foundation (models, migrations, core utilities)
- **Phase 2**: Core logic (services, API endpoints)
- **Phase 3**: UI / Integration (components, wiring)
- **Phase 4**: Hardening (error handling, edge cases, tests)

Each phase must have:

- A clear goal
- Specific deliverables
- What must be true before the phase is complete

### 20. Define Verification Commands

Provide the exact commands to verify each phase:

- Build commands
- Test commands
- Lint commands
- How to run the application locally
- How to verify the specific feature

### 21. Produce the Final Implementation Prompt

Assemble all gathered information into the output format specified in the project documentation.

The refined prompt must be actionable — a developer should be able to implement directly from it.

### 22. Perform Quality Review

Score the output 0–5 on each dimension:

- **Clarity**: Is every requirement unambiguous?
- **Completeness**: Are there obvious gaps?
- **Testability**: Can each requirement be verified?
- **Technical Feasibility**: Can this actually be built with the stated constraints?
- **Scope Control**: Is the scope well-defined with clear non-goals?

If any score is below 4, explain why and identify what needs improvement.

### 23. Stop

After producing the refined implementation prompt and quality review, STOP.

Do not proceed to implementation.

Do not generate code.

Do not create files.

### 24. Wait for Explicit Approval

Present the output and say:

> Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.

Wait for the developer to respond.

If the developer provides feedback, revise and return to step 22.

If the developer replies `approve`, proceed to implementation.

---

## Output Format

Every refinement must produce exactly these sections in this order:

```markdown
# Original Request

[The developer's verbatim request]

# Understanding

[Restatement of what the developer wants, with alternative interpretations if ambiguous]

# Confirmed Requirements

[Requirements explicitly stated in the request]

# Assumptions

[Reasonable inferences, explicitly labeled as assumptions]

# Missing Decisions

[Questions that need developer input before implementation]

# Scope

[What is included, boundaries of the work]

# Non-Goals

[What is explicitly out of scope]

# Repository Context

[When relevant: detected framework, structure, patterns, conventions]

# Refined Implementation Prompt

[The full implementation-ready prompt with all required subsections]

## Objective

## Existing Context

## User Stories

## Functional Requirements

## Technical Constraints

## Data Requirements

## API Requirements

## UI / UX Requirements

## Error States

## Empty States

## Security Requirements

## Testing Requirements

## Acceptance Criteria

## Implementation Phases

## Verification Commands

# Quality Review

[Self-assessment 0–5 on each dimension with notes]

# Approval

[The approval gate statement]
```
