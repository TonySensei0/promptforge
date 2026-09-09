# Changelog

All notable changes to PromptForge are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Claude Code adapter with 8 skills (refine-build, refine-architect, refine-security, refine-performance, refine-frontend, refine-backend, refine-product, refine-debug)
- Cursor adapter with 6 commands and project rule
- Backend and Product methodology profiles
- Profile-specific additions to Claude Code adapter

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
