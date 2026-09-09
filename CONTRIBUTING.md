# Contributing to PromptForge

Thank you for your interest in contributing! PromptForge is an open-source project and we welcome contributions of all kinds.

## Code of Conduct

Be respectful, constructive, and collaborative. We're all here to improve the methodology and tooling together.

## How to Contribute

### Reporting Issues

- Search existing issues before opening a new one
- Include the command used, the request made, and what went wrong
- For bugs in refinement output, include the full refined output

### Suggesting Improvements

- Open an issue describing the improvement
- Explain the use case and expected behavior
- For new profiles, describe the additional analysis lens

### Adding a Profile

1. Create the profile file in `core/profiles/your-profile.md`
2. Add the skill in each adapter:
   - `adapters/antigravity/.agents/skills/refine-your-profile/SKILL.md`
   - `adapters/claude-code/.claude/skills/refine-your-profile/SKILL.md`
   - `adapters/cursor/.cursor/commands/refine-your-profile.md`
3. Add an example in `examples/` demonstrating the profile
4. Add a test fixture in `tests/fixtures/`
5. Update README.md with the new profile

### Adding an Example

1. Create `examples/your-example.md`
2. Include the raw input, the refinement output, and a brief explanation
3. Follow the existing example format

### Adding an Adapter

1. Create a new directory under `adapters/your-adapter/`
2. Follow the patterns from existing adapters (Antigravity, Claude Code, Cursor)
3. Reference the core methodology files — do not duplicate the protocol
4. Include all six base commands at minimum
5. Add installation instructions to README.md

### Adding a Test Fixture

1. Create `tests/fixtures/your-fixture.md`
2. Include the raw input and validation criteria
3. The validation criteria should be machine-checkable where possible

## Development Setup

No build step or runtime is required. PromptForge is a collection of Markdown methodology files.

To test changes:

1. Modify the relevant core file or adapter
2. Use your coding agent with the `/refine-build` command
3. Verify the output matches the expected format
4. Run `scripts/validate-output.sh` on the output

## Style Guidelines

- Use clear, direct language
- Avoid unnecessary prose
- Label all assumptions explicitly
- Never invent architecture not implied by the request
- Keep the base protocol stable — profiles are additive, not replacement
- Keep adapters thin — they reference the core methodology, they don't duplicate it

## Commit Messages

Follow conventional commits:

- `feat: add performance profile`
- `fix: correct validation script`
- `docs: update README with Cursor instructions`
- `refactor: simplify adapter structure`

End with: `Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>`

## Questions?

Open an issue or start a discussion. We're happy to help.
