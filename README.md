# PromptForge

**Turn vague ideas into implementation-ready briefs for AI coding agents.**

PromptForge is a local-first requirements compiler for AI coding agents. It transforms informal developer requests like:

> "make me a dashboard for sales with login and charts"

into structured, implementation-ready engineering prompts with explicit assumptions, scope, acceptance criteria, testing requirements, and an approval gate.

PromptForge does **not** provide another AI model. It uses the host coding agent's model and adds a structured refinement methodology. No hosted backend is required. No database is required. No paid API is required.

---

## What is PromptForge?

PromptForge is a methodology and skill system that guides AI coding agents (Antigravity, Claude Code, Cursor) through a structured refinement process before implementation begins.

The core idea: **refine first, implement second**.

Most developers start implementing immediately when they ask an AI coding agent for help. This leads to rework, misunderstood requirements, and built features that don't match intent. PromptForge changes this by forcing a structured requirements phase that:

1. Understands the request fully
2. Surfaces assumptions explicitly
3. Identifies missing decisions
4. Defines scope and non-goals
5. Creates testable acceptance criteria
6. Stops and waits for approval

Only after explicit `approve` does implementation begin.

---

## Why it exists

AI coding agents are powerful but they need guidance. When you say:

> "add google login"

The agent might:
- Add OAuth with the wrong scopes
- Miss account linking for existing users
- Forget about session management
- Skip security considerations
- Start implementing before understanding your existing auth system

PromptForge guides the agent through a disciplined process that catches these issues **before** any code is written.

---

## Before / After

**Before PromptForge:**

```
You: build a dashboard for sales
Agent: [immediately starts building, makes dozens of assumptions,
        builds features you didn't want, misses critical requirements]
```

**After PromptForge:**

```
You: /refine-build build a dashboard for sales
Agent: [produces structured refinement with assumptions, open questions,
        scope, non-goals, testable criteria]
        Review the refined prompt. Reply with `approve` to begin.

You: [reviews, asks for changes, or types "approve"]
Agent: [implements with full context and clear requirements]
```

---

## Installation

### Antigravity

Copy the `adapters/antigravity/.agents/skills/` directory to your workspace:

```bash
cp -r adapters/antigravity/.agents/skills/ .agents/skills/
```

Or install globally in your Antigravity configuration.

### Claude Code

Copy the `adapters/claude-code/.claude/skills/` directory:

```bash
cp -r adapters/claude-code/.claude/skills/ .claude/skills/
```

Restart Claude Code. Commands like `/refine-build` will be available.

### Cursor

Copy the commands and rules:

```bash
cp -r adapters/cursor/.cursor/commands/ .cursor/commands/
cp -r adapters/cursor/.cursor/rules/ .cursor/rules/
```

Commands like `/refine-build` will be available in Cursor's command palette.

---

## Available Commands

| Command | Purpose |
|---------|---------|
| `/refine-build` | General software development (default) |
| `/refine-architect` | System design and architecture decisions |
| `/refine-security` | Security-sensitive features |
| `/refine-performance` | Performance optimization |
| `/refine-frontend` | User interface and client-side work |
| `/refine-debug` | Bug investigation and diagnosis |
| `/refine-product` | Feature planning and MVP scoping |
| `/refine-backend` | Server-side logic, APIs, data persistence |

---

## Methodology Profiles

Profiles add specialized analysis lenses on top of the base refinement protocol. They do not replace it — they enhance it.

| Profile | Focus Areas |
|---------|-------------|
| **Architect** | System boundaries, components, data flow, scalability, failure modes, observability |
| **Security** | Authentication, authorization, input validation, secrets, privacy, abuse cases, rate limiting |
| **Performance** | Latency, throughput, caching, database performance, profiling, benchmarks |
| **Frontend** | Component architecture, responsive behavior, accessibility, loading/error/empty states |
| **Backend** | API contracts, service boundaries, validation, persistence, transactions, concurrency |
| **Product** | User problems, user stories, MVP scope, success metrics, UX edge cases |
| **Debug** | Reproduction, root cause analysis, hypotheses, minimal fix, regression testing |

---

## Output Format

Every refinement produces exactly these sections:

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

## Design Principles

### 1. Assumption Transparency

Never silently invent critical requirements. Every assumption is explicitly labeled.

### 2. Repository Awareness

When the request concerns an existing project, PromptForge inspects the codebase and prefers existing patterns, frameworks, and conventions.

### 3. Scope Control

Every refinement explicitly defines what IS and IS NOT included.

### 4. Verification-First

Requirements are testable whenever possible. No vague criteria like "the UI should be user friendly."

### 5. Approval Gate

Refinement NEVER silently starts implementation. The developer must explicitly type `approve`.

### 6. No Fake Personas

PromptForge uses engineering methodology profiles (architect, security, performance), not imitation of company employees or private prompting instructions.

---

## Privacy

PromptForge is entirely local. It does not:

- Send requests to any external service
- Store data in a database
- Require an API key or paid service
- Collect telemetry or analytics

The AI reasoning is performed by your existing coding agent. PromptForge provides only the methodology (Markdown files and skill definitions).

---

## Limitations

- **Not an AI model**: PromptForge does not provide intelligence — it provides methodology. The quality of refinement depends on your coding agent's capabilities.
- **Not deterministic**: Since refinement uses an LLM, different runs may produce different outputs. The methodology ensures completeness; it does not guarantee identical results.
- **Requires coding agent**: PromptForge is designed for Antigravity, Claude Code, and Cursor. It is not a standalone application.
- **No persistence**: Refinements are not stored or versioned. Future versions may add refinement history.

---

## Roadmap

### v0.1 (Current)
- `/refine-build` with full protocol
- Markdown output
- Approval gate
- Examples
- MIT license

### v0.2
- Architecture, security, performance, frontend, backend, debug, product profiles
- Repository awareness
- Quality rubric
- Fixture tests

### v0.3
- Cursor adapter
- Claude Code adapter
- Shared profile library
- JSON Schema
- Prompt exports

### v0.4
- Local scripts (project detection, context collection, output validation)
- Local MCP server (optional)
- Refinement history
- Prompt diff
- Evaluation harness

### v1.0
- Stable cross-agent specification
- Versioned profile format
- CI
- Release process
- Community profiles
- Example gallery

---

## Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### How to contribute

- **Add a profile**: Create a new file in `core/profiles/` and add a corresponding skill in each adapter.
- **Add an example**: Add a realistic before/after example to `examples/`.
- **Add an adapter**: Create a new adapter directory following the existing patterns.
- **Add a test fixture**: Add a new fixture to `tests/fixtures/` with validation criteria.
- **Report issues**: Open an issue describing the problem or suggestion.

### Contributor checklist

- [ ] Follow the existing file structure and naming conventions
- [ ] Use the base protocol as the foundation for any new profiles or adapters
- [ ] Add an example demonstrating the new profile or feature
- [ ] Update the README if adding new commands or profiles

---

## License

MIT — see [LICENSE](LICENSE) for details.
