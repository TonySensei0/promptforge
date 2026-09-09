# PromptForge 🔨

**Turn vague ideas into implementation-ready briefs for AI coding agents.**

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Platforms](https://img.shields.io/badge/platforms-Claude%20Code%20%7C%20Antigravity%20%7C%20Cursor-purple)

PromptForge is a **local-first requirements compiler** for AI coding agents. It transforms informal developer requests like:

> "make me a dashboard for sales with login and charts"

into structured, implementation-ready engineering prompts with explicit assumptions, scope, acceptance criteria, testing requirements, and an approval gate.

PromptForge does **not** provide another AI model. It uses the host coding agent's model and adds a structured refinement methodology. No hosted backend is required. No database is required. No paid API is required.

---

## Table of Contents

- [What is PromptForge?](#what-is-promptforge)
- [Why it exists](#why-it-exists)
- [Before / After](#before--after)
- [Installation](#installation)
- [Available Commands](#available-commands)
- [Methodology Profiles](#methodology-profiles)
- [Output Format](#output-format)
- [Design Principles](#design-principles)
- [Privacy](#privacy)
- [Limitations](#limitations)
- [Roadmap](#roadmap)
- [Monetization](#monetization)
- [Contributing](#contributing)
- [License](#license)

---

## What is PromptForge? 🎯

PromptForge is a methodology and skill system that guides AI coding agents (Antigravity, Claude Code, Cursor) through a structured refinement process before implementation begins.

The core idea: **refine first, implement second**. ✨

Most developers start implementing immediately when they ask an AI coding agent for help. This leads to rework, misunderstood requirements, and built features that don't match intent. PromptForge changes this by forcing a structured requirements phase that:

1.  🧠 Understands the request fully
2.  💡 Surfaces assumptions explicitly
3.  ❓ Identifies missing decisions
4.  📐 Defines scope and non-goals
5.  ✅ Creates testable acceptance criteria
6.  🛑 Stops and waits for approval

Only after explicit `approve` does implementation begin.

---

## Why it exists 🤔

AI coding agents are powerful but they need guidance. When you say:

> "add google login"

The agent might:
- Add OAuth with the wrong scopes
- Miss account linking for existing users
- Forget about session management
- Skip security considerations
- Start implementing before understanding your existing auth system

PromptForge guides the agent through a disciplined process that catches these issues **before** any code is written. 🛡️

---

## Before / After ⚡

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

## Installation 🚀

### Claude Code (Recommended) ⭐

Install PromptForge as a Claude Code plugin:

```
/plugin marketplace add TonySensei0/promptforge
/plugin install promptforge@promptforge-marketplace
/reload-plugins
```

Or install directly:

```bash
bash installers/install-claude-code.sh
```

After installation, restart Claude Code and use:

```
/promptforge:refine-build <your request>
/promptforge:refine-security <your request>
/promptforge:refine-audit <your request>
```

See [INSTALL.md](INSTALL.md) for detailed installation instructions.

### Google Antigravity 🔷

Install PromptForge skills for Antigravity:

```bash
curl -fsSL https://raw.githubusercontent.com/TonySensei0/promptforge/main/installers/install-antigravity.sh | bash
```

Replace `TonySensei0/promptforge` with your GitHub username/repo once you fork or clone.

After installation, restart Antigravity and use:

```
/refine-build <your request>
/refine-security <your request>
/refine-audit <your request>
```

### Cursor 🟢

Install PromptForge into your project:

```bash
curl -fsSL https://raw.githubusercontent.com/TonySensei0/promptforge/main/installers/install-cursor.sh | bash -s -- /path/to/your/project
```

Replace `TonySensei0/promptforge` with your GitHub username/repo.

After installation, open the project in Cursor and use the command palette to
find PromptForge commands.

---

## Available Commands 📋

### Claude Code

| Command | Description |
|---------|-------------|
| `/promptforge:refine-build` | General software development (default) |
| `/promptforge:refine-architect` | System design and architecture decisions |
| `/promptforge:refine-security` | Security-sensitive features |
| `/promptforge:refine-performance` | Performance optimization |
| `/promptforge:refine-frontend` | User interface and client-side work |
| `/promptforge:refine-debug` | Bug investigation and diagnosis |
| `/promptforge:refine-product` | Feature planning and MVP scoping |
| `/promptforge:refine-backend` | Server-side logic, APIs, data persistence |
| `/promptforge:refine-audit` | Code review, security audit, dependency audit |
| `/promptforge:refine-testing` | Test strategy and test planning |
| `/promptforge:refine-api` | API design, REST/GraphQL/gRPC planning |
| `/promptforge:refine-db` | General database design and data modeling |
| `/promptforge:refine-mysql` | MySQL/MariaDB-specific design and optimization |
| `/promptforge:refine-postgresql` | PostgreSQL-specific design and optimization |
| `/promptforge:refine-mongodb` | MongoDB-specific design and optimization |

### Antigravity

| Command | Description |
|---------|-------------|
| `/refine-build` | General software development (default) |
| `/refine-architect` | System design and architecture decisions |
| `/refine-security` | Security-sensitive features |
| `/refine-performance` | Performance optimization |
| `/refine-frontend` | User interface and client-side work |
| `/refine-debug` | Bug investigation and diagnosis |
| `/refine-product` | Feature planning and MVP scoping |
| `/refine-backend` | Server-side logic, APIs, data persistence |
| `/refine-audit` | Code review, security audit, dependency audit |
| `/refine-testing` | Test strategy and test planning |
| `/refine-api` | API design, REST/GraphQL/gRPC planning |
| `/refine-db` | General database design and data modeling |
| `/refine-mysql` | MySQL/MariaDB-specific design and optimization |
| `/refine-postgresql` | PostgreSQL-specific design and optimization |
| `/refine-mongodb` | MongoDB-specific design and optimization |

### Cursor

Available via command palette (Ctrl+Shift+P / Cmd+Shift+P):

- **PromptForge: Refine Build** — General software development
- **PromptForge: Refine Architect** — System design and architecture
- **PromptForge: Refine Security** — Security-sensitive features
- **PromptForge: Refine Performance** — Performance optimization
- **PromptForge: Refine Frontend** — UI and client-side work
- **PromptForge: Refine Debug** — Bug investigation
- **PromptForge: Refine Product** — Feature planning and MVP scoping
- **PromptForge: Refine Backend** — Server-side logic and APIs
- **PromptForge: Refine Audit** — Code review, security audit, dependency audit
- **PromptForge: Refine Testing** — Test strategy and test planning
- **PromptForge: Refine API** — API design and contract planning
- **PromptForge: Refine Database** — General database design
- **PromptForge: Refine MySQL** — MySQL/MariaDB-specific design
- **PromptForge: Refine PostgreSQL** — PostgreSQL-specific design
- **PromptForge: Refine MongoDB** — MongoDB-specific design

---

## Methodology Profiles 🧩

Profiles add specialized analysis lenses on top of the base refinement protocol. They do not replace it — they enhance it.

| Profile | Focus Areas |
|---------|-------------|
| 🏗️ **Architect** | System boundaries, components, data flow, scalability, failure modes, observability |
| 🔒 **Security** | Authentication, authorization, input validation, secrets, privacy, abuse cases, rate limiting |
| ⚡ **Performance** | Latency, throughput, caching, database performance, profiling, benchmarks |
| 🎨 **Frontend** | Component architecture, responsive behavior, accessibility, loading/error/empty states |
| ▥️ **Backend** | API contracts, service boundaries, validation, persistence, transactions, concurrency |
| 📊 **Product** | User problems, user stories, MVP scope, success metrics, UX edge cases |
| 🐛 **Debug** | Reproduction, root cause analysis, hypotheses, minimal fix, regression testing |
| 🔍 **Audit** | Code quality, OWASP Top 10, dependency CVEs, license compliance, architecture review |
| 🧪 **Testing** | Test pyramid, unit/integration/E2E planning, coverage targets, CI integration |
| 🌐 **API** | REST/GraphQL/gRPC design, versioning, documentation, error format, rate limiting |
| 🗄️ **Database** | Schema design, migrations, indexing, query optimization, data modeling |
| 🐬 **MySQL** | InnoDB optimization, indexing, replication, HA, backup strategy |
| 🐘 **PostgreSQL** | JSONB, CTEs, window functions, partitioning, RLS, extensions |
| 🍃 **MongoDB** | Document design, aggregation, indexing, sharding, replica sets |

---

## Output Format 📄

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

## Design Principles 🧭

### 1. Assumption Transparency 💬

Never silently invent critical requirements. Every assumption is explicitly labeled.

### 2. Repository Awareness 🗂️

When the request concerns an existing project, PromptForge inspects the codebase and prefers existing patterns, frameworks, and conventions.

### 3. Scope Control 📏

Every refinement explicitly defines what IS and IS NOT included.

### 4. Verification-First ✅

Requirements are testable whenever possible. No vague criteria like "the UI should be user friendly."

### 5. Approval Gate 🚧

Refinement NEVER silently starts implementation. The developer must explicitly type `approve`.

### 6. No Fake Personas 🚫

PromptForge uses engineering methodology profiles (architect, security, performance), not imitation of company employees or private prompting instructions.

---

## Privacy 🔒

PromptForge is entirely local. It does not:

- Send requests to any external service
- Store data in a database
- Require an API key or paid service
- Collect telemetry or analytics

The AI reasoning is performed by your existing coding agent. PromptForge provides only the methodology (Markdown files and skill definitions).

---

## Limitations ⚠️

- **Not an AI model**: PromptForge does not provide intelligence — it provides methodology. The quality of refinement depends on your coding agent's capabilities.
- **Not deterministic**: Since refinement uses an LLM, different runs may produce different outputs. The methodology ensures completeness; it does not guarantee identical results.
- **Requires coding agent**: PromptForge is designed for Antigravity, Claude Code, and Cursor. It is not a standalone application.
- **No persistence**: Refinements are not stored or versioned. Future versions may add refinement history.

---

## Roadmap 🗺️

### v1.0.0 (Current) — Stable Release
- 15 refinement commands across 3 platforms
- 14 methodology profiles
- Plugin system for Claude Code
- Installers for all platforms
- JSON Schema for structured output
- 5 examples with test fixtures
- Shell scripts for project detection and validation

### v1.1.0
- Refinement history and versioning
- Prompt export (Markdown, JSON, YAML)
- Custom profile creation tool
- Community profile gallery

### v1.2.0
- MCP server integration
- Real-time collaboration on refinements
- Diff view for refinement changes
- IDE integrations beyond Claude Code, Antigravity, Cursor

### v2.0.0
- Plugin marketplace with community plugins
- Team workspaces for shared refinements
- CI/CD integration for automated refinement
- Custom methodology builder

---

## Monetization 💰

PromptForge is open-source (MIT License) and free to use. Here are ways to build a business around it:

### 1. Paid Premium Profiles 📦

Create specialized profiles sold as premium packs:

- **Enterprise Profile**: SOC 2, HIPAA, PCI DSS compliance workflows — $49/profile
- **Startup Profile**: MVP scoping, investor-ready specs, pitch deck generation — $29/profile
- **Agency Profile**: Client requirement templates, project estimation, SOW generation — $39/profile
- **Freelancer Profile**: Client brief templates, contract-ready specs, time estimation — $19/profile

### 2. Managed Plugin Marketplace 🏪

Host a curated marketplace of community profiles:

- Take a 20-30% cut of paid profile sales
- Provide hosting, versioning, and discovery
- Similar to VS Code Extension Marketplace or JetBrains Marketplace

### 3. Teams and Organizations 👥

Offer team features:

- Shared refinement library
- Team-wide methodology customization
- Centralized approval workflows
- Audit logs for compliance
- Pricing: $10-25/user/month

### 4. Consulting and Training 🎓

- Enterprise onboarding and custom methodology design
- Team training workshops
- Custom profile development for specific domains
- Pricing: $150-300/hour or $5,000-15,000/project

### 5. AI-Powered Refinement Enhancement 🤖

Add optional AI-powered features (separate from the core methodology):

- Automatic requirement gap detection using code analysis
- Cross-project pattern learning
- Smart template generation from past refinements
- Pricing: Freemium with paid tiers ($9-49/month)

### 6. Certification and Accreditation 🎓

- PromptForge Methodology Certification for developers
- Enterprise training programs
- Certification exam and badge system
- Pricing: $99-299/certification

### 7. Analytics and Insights 📈

For teams using PromptForge:

- Refinement quality metrics across the team
- Common requirement gaps identified
- Implementation success rates
- Pricing: Included in team tier

---

## Contributing 🤝

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

## License 📜

MIT — see [LICENSE](LICENSE) for details.

---

<p align="center">
  Built with 🔨 by <a href="https://github.com/TonySensei0">TonySensei0</a> and the PromptForge community<br>
  <a href="https://github.com/TonySensei0/promptforge">⭐ Star on GitHub</a> · <a href="https://github.com/TonySensei0/promptforge/issues">🐛 Report Bug</a> · <a href="https://github.com/TonySensei0/promptforge/discussions">💬 Discussions</a>
</p>
