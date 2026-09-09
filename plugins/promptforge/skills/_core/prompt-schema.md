# PromptForge Prompt Schema

This document defines the canonical structure of a refined implementation prompt.

Every refined output must contain these sections in this order. Subsections marked **[REQUIRED]** must always be present. Subsections marked **[CONDITIONAL]** should be included when applicable to the task type.

---

## Top-Level Sections (Required)

1. `# Original Request` — Developer's verbatim input
2. `# Understanding` — Restated intent with alternative interpretations if ambiguous
3. `# Confirmed Requirements` — Explicitly stated requirements
4. `# Assumptions` — Reasonable inferences, explicitly labeled
5. `# Missing Decisions` — Questions needing developer input
6. `# Scope` — What is included
7. `# Non-Goals` — What is explicitly excluded
8. `# Repository Context` — Detected project information (or "N/A — new project")
9. `# Refined Implementation Prompt` — The full implementation brief
10. `# Quality Review` — Self-assessment scores
11. `# Approval` — Approval gate statement

---

## Refined Implementation Prompt Subsections

### Objective **[REQUIRED]**

A single sentence describing what this work produces.

Format: "Build [what] so that [who] can [benefit]."

### Existing Context **[REQUIRED for existing repositories, CONDITIONAL for new projects]**

- Detected or recommended framework
- Runtime and version
- Package manager
- Existing authentication system
- Existing database and ORM
- Existing API patterns
- Existing UI component library
- Test framework
- Deployment configuration
- Relevant existing code the new work will integrate with

### User Stories **[CONDITIONAL — include for features with user interaction]**

Format: "As a [role], I want to [action], so that [benefit]."

Include edge-user stories where relevant.

### Functional Requirements **[REQUIRED]**

Each requirement must be:
- A single action or behavior
- Specific enough to implement
- Not dependent on another requirement

Numbered or bulleted. No paragraphs.

### Technical Constraints **[REQUIRED]**

- Framework/runtime constraints
- Performance constraints
- Compatibility constraints
- Existing system constraints
- Dependency constraints

### Data Requirements **[CONDITIONAL]**

- Data entities and their fields
- Relationships between entities
- Data validation rules
- Migration strategy (if modifying schema)
- Seed/test data requirements

Include only if the feature involves data persistence or manipulation.

### API Requirements **[CONDITIONAL]**

- Endpoints (method, path, request/response shape)
- Authentication requirements per endpoint
- Error response format
- Rate limiting expectations
- Versioning approach

Include only if the feature exposes or consumes an API.

### UI / UX Requirements **[CONDITIONAL]**

- Component hierarchy
- Responsive behavior requirements
- Loading state expectations
- Navigation requirements
- Accessibility requirements (WCAG level)

Include only if the feature has a user interface.

### Error States **[REQUIRED]**

List each error scenario and how it should be handled:

- What can fail
- What the user sees
- What gets logged
- How the system recovers (if at all)

### Empty States **[REQUIRED if applicable]**

What the user sees when:

- No data exists for a query
- A list is empty
- A detail view has no content
- An action is unavailable

### Security Requirements **[REQUIRED]**

- Authentication requirements
- Authorization requirements
- Input validation requirements
- Sensitive data handling
- Rate limiting needs
- Dependency risk assessment
- Audit logging requirements

At minimum, state "No additional security requirements beyond existing project standards" if no new concerns exist.

### Testing Requirements **[REQUIRED]**

- Test types needed (unit, integration, e2e)
- Specific scenarios that must be covered
- Test data requirements
- Coverage expectations

### Acceptance Criteria **[REQUIRED]**

Each criterion must be:

- **Specific**: No vague language
- **Verifiable**: Can be checked by test or inspection
- **Independent**: Each stands alone
- **Testable**: Has a pass/fail condition

Format: "Given [context], when [action], then [observable outcome]."

Or numbered checklist items with explicit pass conditions.

### Implementation Phases **[REQUIRED]**

Ordered phases, each with:

- **Phase N: [Name]**
  - Goal: [what this phase accomplishes]
  - Deliverables: [specific outputs]
  - Done when: [verifiable completion condition]

Typical ordering:
1. Foundation (models, migrations, types)
2. Core Logic (services, validators, business rules)
3. Integration (API endpoints, UI components, wiring)
4. Hardening (error handling, edge cases, tests, docs)

### Verification Commands **[REQUIRED]**

Exact commands to verify each phase:

```bash
# Install dependencies
npm install

# Run database migrations
npm run db:migrate

# Run tests
npm test

# Run linter
npm run lint

# Start the application
npm run dev
```

Include phase-specific verification commands.

---

## Quality Constraints

- No invented architecture
- No unnecessary technology choices
- No vague acceptance criteria ("user-friendly", "performant" without metrics)
- No generic motivational language
- All assumptions are explicitly labeled
- All open questions are surfaced
- Scope and non-goals are clearly defined
