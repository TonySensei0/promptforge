---
name: refine-frontend
description: |
  PromptForge frontend profile for UI-focused refinements.
  Adds analysis of component architecture, responsive behavior, accessibility,
  loading/error/empty states, and keyboard navigation. Use with: /refine-frontend
---

# Refine Frontend

Apply the PromptForge base protocol (from `promptforge/core/base-protocol.md`), then overlay the frontend-specific analysis from `promptforge/core/profiles/frontend.md`.

After the base protocol output, add frontend-focused sections:

- Component Architecture
- Responsive Behavior
- Accessibility Requirements
- Loading States
- Error States
- Empty States
- Keyboard Navigation
- Visual Consistency

All base output sections remain. The Refined Implementation Prompt gets frontend subsections.

End with: Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
