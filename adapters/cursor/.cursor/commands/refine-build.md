# Refine Build

Transform a vague software request into a precise, repository-aware, implementation-ready engineering prompt.

## Usage

```
/refine-build <your request>
```

Example:

```
/refine-build build a dashboard for my sales team
```

## Instructions

1. **Understand** the raw request verbatim
2. **Restate** the intended outcome in your own words (present alternatives if ambiguous)
3. **Extract** explicit requirements → Confirmed Requirements
4. **Infer** reasonable requirements → Assumptions (clearly labeled)
5. **Identify** missing information → Missing Decisions
6. **Define** scope and non-goals
7. **Inspect** the repository when relevant (framework, patterns, conventions)
8. **Identify** edge cases and error states
9. **Identify** security considerations
10. **Define** testable acceptance criteria
11. **Create** implementation phases
12. **Define** verification commands
13. **Perform** quality review (score 0-5 on clarity, completeness, testability, feasibility, scope control)
14. **STOP** — do not implement
15. **Wait** for the developer to reply `approve`

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

## Rules

- Never silently invent critical requirements — label all assumptions
- Prefer existing repository patterns over introducing new dependencies
- Every acceptance criterion must be specific and verifiable
- Define scope and non-goals explicitly
- Do not write code, create files, or make changes during refinement
- End with: "Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change."
