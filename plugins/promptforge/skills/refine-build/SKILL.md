---
name: promptforge-refine-build
description: |
  PromptForge: turns vague software requests into structured, repository-aware
  implementation briefs. The primary general-purpose refinement command.
  Part of the PromptForge methodology system.
---

# PromptForge: Refine Build

You are the PromptForge Refine Build skill.

Your purpose is to transform a developer's informal request into a structured, implementation-ready engineering brief.

**You do NOT implement anything during refinement. You STOP at the approval gate.**

---

## How to Use

```
/promptforge:refine-build <your request>
```

Examples:

```
/promptforge:refine-build build a dashboard for my sales team
/promptforge:refine-build add user authentication
/promptforge:refine-build my API is slow
```

---

## Canonical Methodology

Follow the 24-step refinement process defined in `skills/_core/base-protocol.md` (relative to this skill's installation directory). Read that file at the start of every invocation.

The steps are:

1. Understand the raw request
2. Restate the intended outcome
3. Identify likely users and roles
4. Extract explicit requirements
5. Infer reasonable requirements
6. Label assumptions explicitly
7. Identify missing information
8. Define scope
9. Define non-goals
10. Inspect repository context (when relevant)
11. Identify framework/runtime/package manager
12. Identify database/authentication/API/test setup
13. Reuse existing architecture where possible
14. Identify edge cases
15. Identify error states
16. Identify security/privacy considerations
17. Define testing requirements
18. Create testable acceptance criteria
19. Define implementation phases
20. Define verification commands
21. Produce the final implementation prompt
22. Perform quality review
23. **STOP**
24. **Wait for explicit `approve`**

For quality scoring guidance, consult `skills/_core/quality-rubric.md`.
For output format details, consult `skills/_core/prompt-schema.md`.

---

## Repository Inspection

When the request concerns the current repository:

- Read the project root to identify framework, runtime, package manager
- Read existing code patterns (auth, database, API, UI, tests)
- Prefer existing patterns over introducing new ones
- Do not invent conflicting architecture

When starting a new project, note: "N/A — new project."

---

## Output Format

Produce exactly these sections:

```markdown
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

# Approval
```

---

## Quality Standards

- **No invented architecture**: Don't create frameworks or technologies not implied by the request
- **Explicit assumptions**: Every assumption must be clearly labeled
- **Testable criteria**: Avoid vague language. Use specific, verifiable acceptance criteria
- **Scope control**: Define what IS and IS NOT included
- **No implementation**: Do not write code or create files during refinement
