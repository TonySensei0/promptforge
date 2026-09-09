# PromptForge Distribution Architecture

This document explains how PromptForge is packaged and distributed across
different AI coding agent platforms.

## Overview

PromptForge is a methodology-first project. The core content (base protocol,
quality rubric, profiles) lives in `core/` as Markdown files. Each platform
adapter translates this methodology into the native format that the platform
understands.

```
┌─────────────────────────────────────────────────────────┐
│                    core/ (canonical)                    │
│  base-protocol.md, prompt-schema.md, quality-rubric.md  │
│  profiles/: architect, security, performance, ...       │
└───────────────────────┬─────────────────────────────────┘
                        │ referenced by
        ┌───────────────┼───────────────┐
        ▼               ▼               ▼
  adapters/         adapters/      adapters/
  claude-code/      antigravity/   cursor/
```

## Platform Adapters

### Claude Code

Claude Code supports skills as `.claude/skills/*/SKILL.md` files. PromptForge
provides 8 skills (one per profile) plus a full plugin system.

**Plugin architecture**: Claude Code plugins are self-contained directories
installed under `~/.claude/plugins/`. The plugin includes all skills and
bundles the core methodology files inside the plugin directory so no external
dependencies are needed.

**Installation**:
1. Via marketplace: `/plugin marketplace add OWNER/promptforge`
2. Via marketplace: `/plugin install promptforge@promptforge-marketplace`
3. Restart with `/reload-plugins`

**Command format**: `/promptforge:refine-build`, `/promptforge:refine-security`, etc.

**Files**:
- `plugins/promptforge/skills/refine-{build,architect,...}/SKILL.md` — self-contained skills
- `plugins/promptforge/skills/_core/` — bundled methodology (included in plugin)
- `.claude-plugin/marketplace.json` — marketplace definition
- `plugins/promptforge/.claude-plugin/plugin.json` — plugin manifest

### Google Antigravity

Antigravity uses Agent Skills as `~/.gemini/antigravity/skills/<name>/SKILL.md`.

Each skill references `references/base-protocol.md` and profile files using
relative paths within the skill directory.

**Installation**: Copy `adapters/antigravity/.agents/skills/` to
`~/.gemini/antigravity/skills/`.

**Command format**: `/refine-build`, `/refine-security`, etc.

**Files**:
- `adapters/antigravity/.agents/skills/refine-{build,architect,...}/SKILL.md`
- `adapters/antigravity/.agents/skills/refine-build/references/` — symlinks to core/

### Cursor

Cursor uses project-level `.cursor/commands/` (Markdown command files) and
`.cursor/rules/` (project rules in `.mdc` format).

**Installation**: Run `installers/install-cursor.sh /path/to/project`.

**Command format**: Via Cursor command palette ("PromptForge: Refine Build").

**Files**:
- `adapters/cursor/.cursor/commands/refine-{build,architect,...}.md`
- `adapters/cursor/.cursor/rules/promptforge.mdc`

## Why Each Platform Has a Different Adapter

Each AI coding agent has a different configuration mechanism:

| Platform | Mechanism | Config Location | Skill Format |
|----------|-----------|-----------------|--------------|
| Claude Code | Plugin system | `~/.claude/plugins/` | SKILL.md with YAML frontmatter |
| Antigravity | Agent Skills | `~/.gemini/antigravity/skills/` | SKILL.md with YAML frontmatter |
| Cursor | Commands + Rules | `.cursor/` (project) | Markdown commands + .mdc rules |

The adapters are thin translation layers. They reference the same core
methodology files but format the instructions for each platform's native system.

## Self-Containment Requirement

Claude Code plugins are cached at install time. A plugin cannot assume that
`../../core/` or any relative path outside the plugin directory will resolve
correctly after installation. The plugin must include all files it needs.

The `plugins/promptforge/skills/_core/` directory contains copies of the
core methodology files. This ensures the plugin works regardless of where
or how it was installed.

## Versioning

PromptForge uses semantic versioning. The single source of truth is the
`VERSION` file at the project root. All installers read this file at runtime.

```
v1.0.0  — Stable release
v0.3.0  — Beta with all adapters
v0.1.0  — Initial release
```

## Release Process

See [RELEASE.md](RELEASE.md) for the step-by-step release checklist.

## Installer Security

Installers follow these principles:

1. **No arbitrary code execution**: Installers copy files, they do not download
   and execute remote scripts (except for the documented `curl | bash` pattern
   which is optional and clearly labeled).
2. **No `sudo`**: Installers never require elevated privileges.
3. **No unrelated file deletion**: Uninstallers only remove PromptForge-owned files.
4. **Idempotent**: Running an installer twice produces the same result as running it once.
5. **Safe failures**: Errors are reported clearly. Partial installations are detected
   and reported.

## Testing

Each platform has a verification script:
- `scripts/verify-installation.sh claude`
- `scripts/verify-installation.sh antigravity`
- `scripts/verify-installation.sh cursor`

These scripts check that the required files exist and are valid.
