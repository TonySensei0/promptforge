<div align="center">

# PromptForge 🔨

### Turn vague ideas into implementation-ready briefs for AI coding agents

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Version](https://img.shields.io/badge/version-1.0.0-orange.svg)
![Local First](https://img.shields.io/badge/local--first-✔-success.svg)
![No Backend](https://img.shields.io/badge/backend-none-lightgrey.svg)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)
![Platforms](https://img.shields.io/badge/platforms-Claude%20Code%20%7C%20Antigravity%20%7C%20Cursor-purple)

</div>

---

PromptForge is a **local-first requirements compiler** for AI coding agents. It transforms informal developer requests like:

> 💬 *"make me a dashboard for sales with login and charts"*

into structured, implementation-ready engineering prompts with explicit assumptions, scope, acceptance criteria, testing requirements, and an approval gate.

> **Note:** PromptForge does **not** provide another AI model. It uses your host coding agent's model and adds a structured refinement methodology. No hosted backend. No database. No paid API.

---

## 📚 Table of Contents

- [What is PromptForge?](#-what-is-promptforge)
- [Why It Exists](#-why-it-exists)
- [Before / After](#-before--after)
- [Installation](#-installation)
- [Available Commands](#-available-commands)
- [Methodology Profiles](#-methodology-profiles)
- [Output Format](#-output-format)
- [Design Principles](#-design-principles)
- [Privacy](#-privacy)
- [Limitations](#-limitations)
- [Roadmap](#-roadmap)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🔍 What is PromptForge?

PromptForge is a methodology and skill system that guides AI coding agents (**Antigravity**, **Claude Code**, **Cursor**) through a structured refinement process before implementation begins.

> **The core idea: refine first, implement second.** ✨

Most developers start implementing immediately when they ask an AI coding agent for help. This leads to rework, misunderstood requirements, and built features that don't match intent.

PromptForge forces a structured requirements phase that:

| Step | Action |
|:---:|---|
| 1️⃣ | Understands the request fully |
| 2️⃣ | Surfaces assumptions explicitly |
| 3️⃣ | Identifies missing decisions |
| 4️⃣ | Defines scope and non-goals |
| 5️⃣ | Creates testable acceptance criteria |
| 6️⃣ | Stops and waits for approval |

Only after explicit `approve` does implementation begin. ✅

```mermaid
flowchart LR
    A["💬 Vague Request"] --> B["/refine-build"]
    B --> C["📋 Structured Refinement"]
    C --> D{"✅ Approve?"}
    D -- "✏️ Revise" --> C
    D -- "👍 Yes" --> E["⚙️ Implementation"]
```

---

## ❓ Why It Exists

AI coding agents are powerful — but they need guidance. When you say:

> "add google login"

The agent might:

- ❌ Add OAuth with the wrong scopes
- ❌ Miss account linking for existing users
- ❌ Forget about session management
- ❌ Skip security considerations
- ❌ Start implementing before understanding your existing auth system

PromptForge catches these issues **before** any code is written. 🛡️

---

## 🔁 Before / After

<table>
<tr>
<th>🚫 Before PromptForge</th>
<th>✅ After PromptForge</th>
</tr>
<tr>
<td>

```
You: build a dashboard for sales
Agent: [immediately starts building,
makes dozens of assumptions, builds
features you didn't want, misses
critical requirements]
```

</td>
<td>

```
You: /refine-build build a dashboard
     for sales
Agent: [produces structured refinement:
assumptions, open questions, scope,
non-goals, testable criteria]
"Reply with `approve` to begin."

You: approve
Agent: [implements with full context]
```

</td>
</tr>
</table>

---

## 📦 Installation

## 📦 Installation

PromptForge is just a collection of skill files. You do **not** need to clone this repo or install a separate package. Pick the instructions for your IDE below and copy the files into your project.

---

### Option A: Install for a single project

Install PromptForge inside the project you're currently working on. The skills will only be available in that project.

**Antigravity** (per-project):
```bash
# From your project root:
cp -r /path/to/promptforge/adapters/antigravity/.agents/skills/ .agents/skills/
```

**Claude Code** (per-project):
```bash
# From your project root:
cp -r /path/to/promptforge/adapters/claude-code/.claude/skills/ .claude/skills/
```
Then restart Claude Code.

**Cursor** (per-project):
```bash
# From your project root:
cp -r /path/to/promptforge/adapters/cursor/.cursor/commands/ .cursor/commands/
cp -r /path/to/promptforge/adapters/cursor/.cursor/rules/ .cursor/rules/
```

---

### Option B: Install globally (all projects)

Install PromptForge once so it's available in every project you work on.

**Antigravity**: Copy the `adapters/antigravity/.agents/skills/` contents into your global Antigravity skills directory (check Antigravity docs for the global path).

**Claude Code**: Copy the `adapters/claude-code/.claude/skills/` contents into `~/.claude/skills/`. Restart Claude Code.

**Cursor**: Copy `adapters/cursor/.cursor/commands/` to your global Cursor commands directory and `adapters/cursor/.cursor/rules/` to your global Cursor rules directory.

---

### How to use after installation

After copying the files, type the command for the skill you want:

```
/refine-build
/refine-ssh
/ai-security-audit
```

The full list of available commands is in the [Available Commands](#-available-commands) section below.

---

### Do I need to clone this repo?

**No.** You only need to clone this repo if you want to contribute, modify the methodology, or read the source. To use PromptForge in your projects, just download the files or copy them once and install as shown above.

---

## ⚡ Available Commands

| Command | Purpose |
|---|---|
| `/refine-build` 🏗️ | General software development (default) |
| `/refine-architect` 🧭 | System design and architecture decisions |
| `/refine-security` 🔒 | Security-sensitive features |
| `/refine-performance` 🚀 | Performance optimization |
| `/refine-frontend` 🎨 | User interface and client-side work |
| `/refine-debug` 🐛 | Bug investigation and diagnosis |
| `/refine-product` 📊 | Feature planning and MVP scoping |
| `/refine-backend` 🗄️ | Server-side logic, APIs, data persistence |
| `/refine-audit` 🔍 | Code review, security audit, dependency audit, compliance |
| `/refine-ssh` 🔐 | SSH configuration, key management, hardening, bastion hosts, tunneling |
| `/ai-security-audit` 🛡️ | Scan codebase for all vulnerabilities (secrets, auth, injection, XSS, etc.) |
| `/ai-security-fix` 🔧 | Fix vulnerabilities from a security audit report |
| `/refine-testing` 🧪 | Test strategy, coverage planning, QA |
| `/refine-api` 🌐 | API design, REST/GraphQL/gRPC contracts, versioning |
| `/refine-db` 🗃️ | Database-agnostic schema design, migrations, indexing |
| `/refine-mysql` 🐬 | MySQL/MariaDB: InnoDB, indexing, replication, HA |
| `/refine-postgresql` 🐘 | PostgreSQL: JSONB, CTEs, RLS, extensions, partitioning |
| `/refine-mongodb` 🍃 | MongoDB: documents, aggregation, indexing, sharding |

---

## 🧩 Methodology Profiles

Profiles add specialized analysis lenses on top of the base refinement protocol. **They do not replace it — they enhance it.**

| Profile | Focus Areas |
|---|---|
| 🧭 **Architect** | System boundaries, components, data flow, scalability, failure modes, observability |
| 🔒 **Security** | Authentication, authorization, input validation, secrets, privacy, abuse cases, rate limiting |
| 🚀 **Performance** | Latency, throughput, caching, database performance, profiling, benchmarks |
| 🎨 **Frontend** | Component architecture, responsive behavior, accessibility, loading/error/empty states |
| 🗄️ **Backend** | API contracts, service boundaries, validation, persistence, transactions, concurrency |
| 📊 **Product** | User problems, user stories, MVP scope, success metrics, UX edge cases |
| 🐛 **Debug** | Reproduction, root cause analysis, hypotheses, minimal fix, regression testing |
| 🔍 **Audit** | Code quality, OWASP Top 10, dependency CVEs, license compliance, architecture review |
| 🔐 **SSH** | Key management, authentication hardening, bastion hosts, tunneling, session auditing |
| 🧪 **Testing** | Test pyramid, unit/integration/E2E planning, coverage targets, CI integration |
| 🌐 **API** | REST/GraphQL/gRPC design, versioning, documentation, error format, rate limiting |
| 🗃️ **Database** | Schema design, migrations, indexing, query optimization, data modeling |
| 🐬 **MySQL** | InnoDB optimization, indexing, replication, HA, backup strategy |
| 🐘 **PostgreSQL** | JSONB, CTEs, window functions, partitioning, RLS, extensions |
| 🍃 **MongoDB** | Document design, aggregation pipelines, indexing, sharding, replica sets |

---

## 📄 Output Format

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

## 🧭 Design Principles

<details>
<summary><strong>1. 🔍 Assumption Transparency</strong></summary>
<br>
Never silently invent critical requirements. Every assumption is explicitly labeled.
</details>

<details>
<summary><strong>2. 🗂️ Repository Awareness</strong></summary>
<br>
When the request concerns an existing project, PromptForge inspects the codebase and prefers existing patterns, frameworks, and conventions.
</details>

<details>
<summary><strong>3. 🎯 Scope Control</strong></summary>
<br>
Every refinement explicitly defines what IS and IS NOT included.
</details>

<details>
<summary><strong>4. ✅ Verification-First</strong></summary>
<br>
Requirements are testable whenever possible. No vague criteria like "the UI should be user friendly."
</details>

<details>
<summary><strong>5. 🚦 Approval Gate</strong></summary>
<br>
Refinement NEVER silently starts implementation. The developer must explicitly type <code>approve</code>.
</details>

<details>
<summary><strong>6. 🚫 No Fake Personas</strong></summary>
<br>
PromptForge uses engineering methodology profiles (architect, security, performance), not imitation of company employees or private prompting instructions.
</details>

---

## 🔐 Privacy

PromptForge is entirely local. It does **not**:

- ❌ Send requests to any external service
- ❌ Store data in a database
- ❌ Require an API key or paid service
- ❌ Collect telemetry or analytics

The AI reasoning is performed by your existing coding agent. PromptForge provides only the methodology (Markdown files and skill definitions).

---

## ⚠️ Limitations

- **Not an AI model** — PromptForge provides methodology, not intelligence. Output quality depends on your coding agent's capabilities.
- **Not deterministic** — Since refinement uses an LLM, different runs may produce different outputs.
- **Requires a coding agent** — Built for Antigravity, Claude Code, and Cursor. Not a standalone application.
- **No persistence** — Refinements are not stored or versioned (yet).

---

## 🗺️ Roadmap

- [x] **v1.0.0** — 15 commands across 3 platforms, 14 profiles, plugin system, installers
- [ ] **v1.1.0** — Refinement history, prompt export, custom profile tool, community gallery
- [ ] **v1.2.0** — MCP server, real-time collaboration, prompt diff, more IDE integrations
- [ ] **v2.0.0** — Plugin marketplace, team workspaces, CI/CD integration, custom methodology builder

---

## 🤝 Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

| Contribution | How |
|---|---|
| 🧩 Add a profile | Create a file in `core/profiles/` + matching skill in each adapter |
| 📘 Add an example | Add a realistic before/after example to `examples/` |
| 🔌 Add an adapter | Create a new adapter directory following existing patterns |
| 🧪 Add a test fixture | Add a fixture to `tests/fixtures/` with validation criteria |
| 🐞 Report issues | Open an issue describing the problem or suggestion |

**Contributor checklist:**

- [ ] Follow existing file structure and naming conventions
- [ ] Use the base protocol as the foundation for new profiles/adapters
- [ ] Add an example demonstrating the new profile or feature
- [ ] Update the README if adding new commands or profiles
