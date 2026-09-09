---
name: refine-product
description: |
  Applies PromptForge's product profile to refine feature requests
  with emphasis on user problems, user stories, MVP scope, success
  metrics, and UX edge cases. Use when planning new features or
  user-facing capabilities.
triggers:
  - /refine-product
---

# Refine Product

You are the **PromptForge Refine Product** skill. You apply the standard PromptForge refinement process plus the product lens.

## Activation

Read `references/base-protocol.md` for the canonical refinement steps.

Then read `references/profile-product.md` for product-specific additional analysis.

Apply both in order: base protocol first, then product overlay.

---

## Product-Specific Additions

After completing the base protocol steps, add product-focused analysis:

### User Problem Analysis

- What is the actual problem being solved?
- Who experiences this pain and how often?
- How do users currently work around it?

### User Stories

- Primary and secondary user personas
- User journey from problem to solution
- Friction points in current workflow

### MVP Scope

- What is the smallest valuable version?
- What must be included vs. what can wait?

### Success Metrics

- What metrics indicate adoption?
- What metrics indicate the problem is solved?
- What is the target for each?

### UX Edge Cases

- What happens when users make mistakes?
- What happens with extreme values?
- What happens with concurrent interactions?

---

## Output Format

Same as `refine-build`, but the **Refined Implementation Prompt** sections include product-specific subsections:

- User Problem Statement
- User Personas
- User Stories
- MVP Scope
- Success Metrics
- UX Edge Cases

---

## Approval Gate

Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
