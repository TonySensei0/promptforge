# Changelog

All notable changes to PromptForge are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- SSH profile and refine-ssh skill across all adapters (18 commands total)
- AI Security Audit profile and refine-ai-security-audit skill
- AI Security Fix profile and refine-ai-security-fix skill
- Security audit example (security-audit-promptforge.md)
- Claude Code plugin system with bundled core methodology
- Plugin marketplace registration for all 18 commands
- Improved README installation instructions (per-project vs global, no-clone-needed)
- Removed Claude/Anthropic attribution from CONTRIBUTING.md

### Changed
- Bumped version to 1.1.0

## [1.0.0] - 2026-09-10

### Added
- Initial release with 18 commands across Claude Code, Antigravity, and Cursor adapters
- 17 core profiles (architect, security, performance, frontend, backend, product, debug, audit, ssh, testing, api, db, mysql, postgresql, mongodb, ai-security-audit, ai-security-fix)
- JSON Schema for structured refinement output
- 5 refinement examples
- 4 test fixtures with validation criteria
- 3 shell scripts (detect-project, collect-context, validate-output)
- MIT License
- README with installation instructions
- CONTRIBUTING guide
- Output format specification
- Approval gate mechanism
- Assumption transparency requirements
- Scope control requirements
- Repository awareness requirements

[Unreleased]: https://github.com/promptforge/promptforge/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/promptforge/promptforge/releases/tag/v1.0.0
