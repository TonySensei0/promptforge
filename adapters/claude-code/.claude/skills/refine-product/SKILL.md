---
name: refine-product
description: |
  PromptForge product profile for feature planning refinements.
  Adds analysis of user problems, user stories, MVP scope, success metrics,
  and UX edge cases. Use with: /refine-product
---

# Refine Product

Apply the PromptForge base protocol (from `promptforge/core/base-protocol.md`), then overlay the product-specific analysis from `promptforge/core/profiles/product.md`.

After the base protocol output, add product-focused sections:

- User Problem Statement
- User Personas
- User Stories
- MVP Scope
- Success Metrics
- UX Edge Cases

All base output sections remain. The Refined Implementation Prompt gets product subsections.

End with: Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
