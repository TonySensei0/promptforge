# Frontend Profile

Use this profile when the request involves user interface, frontend architecture, or client-side functionality.

## Additional Review Focus

Apply the base protocol first. Then apply these frontend-specific lenses:

### Component Architecture

- What are the major UI components?
- How do components compose together?
- What is the component hierarchy?
- Where should state live (local, lifted, global store, URL)?
- What component patterns exist in the project (compound, render props, hooks, etc.)?
- Are components reusable across the application?
- How are components styled (CSS modules, Tailwind, styled-components, etc.)?

### Responsive Behavior

- What screen sizes must be supported?
- What is the mobile-first vs. desktop-first strategy?
- How does the layout adapt at breakpoints?
- What interactions change on touch vs. mouse?
- What is the minimum supported viewport width?

### Accessibility

- What WCAG compliance level is required (A, AA, AAA)?
- How is keyboard navigation handled?
- What ARIA attributes are needed?
- How are images and media described (alt text, captions)?
- How is focus managed during navigation and modal dialogs?
- What is the color contrast ratio?
- How are screen readers supported?
- Are there skip links and landmark regions?

### Loading States

- What does the user see while content loads?
- How are loading states communicated (spinners, skeletons, progress bars)?
- What happens during partial loads (progressive rendering)?
- How are optimistic updates communicated?
- What is the loading state timeout behavior?

### Error States

- What does the user see when a request fails?
- How are validation errors displayed inline?
- How are catastrophic errors communicated?
- What recovery actions are offered?
- Are errors logged with enough context for debugging?

### Empty States

- What does the user see when a list has no items?
- What does the user see when a detail view has no content?
- What action is offered to create the first item?
- Are empty states differentiated from loading states?

### Keyboard Navigation

- What keyboard shortcuts exist or should exist?
- How does tab order flow through the interface?
- What focus indicators are visible?
- How do modal dialogs trap and restore focus?
- What shortcuts conflict with browser or OS defaults?

### Visual Consistency

- What design system or component library is used?
- How are colors, typography, and spacing standardized?
- What is the design token system?
- How are themes handled (light, dark, high contrast)?
- What icon system is used?

## Frontend-Specific Open Questions

Add these questions when relevant:

- What browsers and versions must be supported?
- What is the JavaScript target (ES version, transpilation)?
- Are there offline or PWA requirements?
- What is the internationalization approach?

## Frontend-Specific Non-Goals

Explicitly state:

- What platforms are out of scope (mobile app, desktop)?
- What browser versions are not supported?
- What animations or micro-interactions are deferred?
