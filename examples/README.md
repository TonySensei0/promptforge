# PromptForge Examples

This directory contains before/after examples demonstrating PromptForge's refinement methodology.

Each example shows:
- **Raw Input**: The vague developer request
- **Refined Output**: The structured implementation-ready prompt
- **Key Insights**: What the refinement added

## Examples

| Example | Input | Key Insight |
|---------|-------|-------------|
| [vague-web-app.md](vague-web-app.md) | "make me a dashboard for sales with login and charts" | Vague request → full spec with data model, API contracts, acceptance criteria |
| [vague-api.md](vague-api.md) | "create an api for uploading files" | Minimal request → security analysis, file validation, error handling |
| [vague-mobile-app.md](vague-mobile-app.md) | "make a fitness app" | Single word → platform decision, offline-first architecture, data model |
| [vague-auth-feature.md](vague-auth-feature.md) | "add google login" | Simple request → OAuth security, account linking, existing system integration |
| [performance-problem.md](performance-problem.md) | "my api is slow fix it" | Bug report → debug methodology, diagnosis-first approach, hypotheses |

## Using These Examples

These examples serve as:
1. **Documentation**: Show users what refinement looks like
2. **Training**: Help contributors understand the methodology
3. **Test cases**: Verify that refinement produces complete, structured output
4. **Benchmarks**: Provide comparison points for evaluating refinement quality

## Contributing Examples

Good examples demonstrate:
- A genuinely vague or ambiguous input
- The value added by the refinement process
- At least one surprising insight (something the developer likely didn't consider)
- All required output sections
- Testable acceptance criteria

See [CONTRIBUTING.md](../CONTRIBUTING.md) for how to add examples.
