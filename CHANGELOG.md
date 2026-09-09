# Changelog

All notable changes to PromptForge are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- 7 new skills: refine-audit, refine-testing, refine-api, refine-db, refine-mysql, refine-postgresql, refine-mongodb
- Claude Code plugin system (plugins/promptforge/ with bundled core methodology)
- Claude Code marketplace (.claude-plugin/marketplace.json)
- Antigravity distribution adapter (7 new skills)
- Cursor distribution adapter (7 new command files)
- Distribution layer: installers/, .claude-plugin/, plugins/
- Universal installer (installers/install.sh)
- Platform-specific installers (claude-code, antigravity, cursor)
- Uninstaller (installers/uninstall.sh)
- Installation verification script (scripts/verify-installation.sh)
- DISTRIBUTION.md — distribution architecture documentation
- RELEASE.md — release process documentation
- VERSION file — single source of truth for versioning
- 7 new core profiles (audit, testing, api, db, mysql, postgresql, mongodb)
- Monetization section in README
- Professional README with badges, emojis, table of contents, visuals
- Total: 15 commands across Claude Code, Antigravity, and Cursor adapters
- Total: 14 methodology profiles (7 original + 7 new)

## [0.3.0] - 2026-09-09

### Added
- Cursor adapter with 6 commands (refine-build, refine-architect, refine-security, refine-performance, refine-frontend, refine-debug)
- Cursor project rule (promptforge.mdc)
- Antigravity adapter with 7 skills (refine-build, refine-architect, refine-security, refine-performance, refine-frontend, refine-debug)
- Claude Code adapter with 7 skills (refine-build, refine-architect, refine-security, refine-performance, refine-frontend, refine-debug)
- All 7 methodology profiles (architect, security, performance, frontend, backend, product, debug)
- JSON Schema for structured refinement output
- 5 examples (vague-web-app, vague-api, vague-mobile-app, vague-auth-feature, performance-problem)
- 4 test fixtures with validation criteria
- 3 shell scripts (detect-project, collect-context, validate-output)
- Prompt schema documentation
- Quality rubric documentation

### Changed
- Base protocol refined with 24-step process
- Output format standardized to 11 sections

### Added (Infrastructure)
- Shell scripts for project detection, context collection, and output validation
- Test fixtures with validation criteria
- JSON Schema for structured output
- Cross-adapter profile references

## [0.2.0] - 2026-09-09

### Added
- Core base protocol (24-step refinement process)
- Quality rubric (5-dimension scoring)
- Prompt schema (output format specification)
- Architect profile
- Security profile
- Performance profile
- Frontend profile
- Debug profile

### Added (Testing)
- Test fixture structure
- Validation criteria for test fixtures

## [0.1.0] - 2026-09-09

### Added
- Initial project structure
- `/refine-build` Antigravity skill
- Core base protocol
- Quality rubric
- Prompt schema
- 5 examples
- 4 test fixtures
- MIT License
- README with installation instructions
- CONTRIBUTING guide
- Output format specification
- Approval gate mechanism
- Assumption transparency requirements
- Scope control requirements
- Repository awareness requirements

[Unreleased]: https://github.com/promptforge/promptforge/compare/v0.3.0...HEAD
[0.3.0]: https://github.com/promptforge/promptforge/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/promptforge/promptforge/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/promptforge/promptforge/releases/tag/v0.1.0
