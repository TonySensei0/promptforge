# Example: Vague Auth Feature Request

## Input

```
add google login
```

## Refinement Output

# Original Request

"add google login"

# Understanding

The developer wants to add Google as a login/sign-in option to an existing application. The specifics about implementation, user experience, and data handling are unspecified.

# Confirmed Requirements

1. Users can authenticate using their Google account

# Assumptions

- **Assumption**: Google OAuth 2.0 will be used (standard for "Google login").
- **Assumption**: This is being added to an existing application that already has some form of user accounts.
- **Assumption**: Users will be able to choose between existing login methods and Google login.
- **Assumption**: The application needs a backend to handle OAuth callbacks securely (client-side only OAuth is possible but less secure).
- **Assumption**: Google login users will have a user account created/linked in the existing user database.

# Missing Decisions

1. **Does the app already have authentication?** What is the existing auth system?
2. **Should users be able to link Google to an existing account?** Or is Google login a separate sign-up flow?
3. **What user data is requested from Google?** (email, name, profile picture?)
4. **What happens if a user's Google email matches an existing account?** (auto-link, merge, error?)
5. **Is Google the only OAuth provider, or will others be added?** (GitHub, Apple, etc.)
6. **What scopes are needed?** (openid, email, profile are standard)
7. **Is server-side or client-side OAuth preferred?**

# Scope

- Google OAuth 2.0 integration
- "Sign in with Google" button in the login UI
- OAuth callback handling
- User account creation or linking for Google-authenticated users
- Session management compatible with existing auth
- Logout that clears Google session state
- Error handling for OAuth failures

# Non-Goals

- Other OAuth providers (GitHub, Apple, Facebook, etc.)
- Social features (sharing, friend finding via Google contacts)
- Account merging UI (auto-merge on matching email only)
- Google Workspace domain restriction
- Google One Tap / automatic sign-in
- Phone number verification via Google

# Repository Context

> ⚠️ **Repository inspection required.** Before implementing, the repository must be inspected to identify:
>
> - Existing authentication framework (Passport, NextAuth, Devise, etc.)
> - Existing user model and database schema
> - Existing session management
> - Existing UI patterns for login forms
> - Environment variable conventions for secrets

# Refined Implementation Prompt

## Objective

Add Google OAuth login to the existing application so that users can authenticate with their Google account alongside existing login methods.

## Existing Context

> **Requires repository inspection.** The implementation approach depends on the existing auth framework. Common patterns:

- **Next.js**: NextAuth.js with Google provider
- **Express/Node**: Passport.js with `passport-google-oauth20`
- **Rails**: OmniAuth Google OAuth2 gem
- **Django**: `social-auth-app-django`
- **Laravel**: `socialiteproviders/google`

## User Stories

- As a **new user**, I want to sign up using my Google account so that I don't need to create a password.
- As an **existing user**, I want to sign in with Google so that I can access my account quickly.
- As a **user**, I want my Google profile information (name, email, avatar) to be reflected in my account.
- As a **user**, I want to disconnect Google from my account if I no longer want to use it.
- As a **user**, I want to log out completely so that my Google session is also cleared.

## Functional Requirements

1. A "Sign in with Google" button is displayed on the login page
2. Clicking the button initiates the Google OAuth 2.0 flow
3. After Google authorization, the user is redirected back to the application
4. If the Google account matches an existing user (by email), the user is logged in
5. If the Google account does not match an existing user, a new account is created
6. The user's session is established after successful Google authentication
7. Users can log out, which terminates both the app session and Google OAuth state
8. Error handling for: user denies consent, Google API errors, network failures

## Technical Constraints

- OAuth 2.0 with PKCE (recommended for security) or authorization code flow
- Google OAuth client ID and secret stored in environment variables
- HTTPS required in production for OAuth callbacks
- State parameter used to prevent CSRF attacks
- Redirect URIs must be registered in Google Cloud Console
- Session management must be compatible with existing auth system

## Data Requirements

**Add to existing users table (or create oauth_identities table):**

Option A — Add fields to users table:
- `google_id` (string, nullable, unique) — Google's sub claim
- `avatar_url` (string, nullable) — Google profile picture URL

Option B — Separate oauth_identities table:
- id (primary key)
- user_id (foreign key to users)
- provider (string: 'google')
- provider_id (string: Google's sub claim)
- created_at (timestamp)

**Decision needed**: Which approach matches the existing database conventions?

## API Requirements

No new API endpoints needed. OAuth flows through browser redirects. The application handles the OAuth callback at a registered route (e.g., `/api/auth/callback/google`).

## UI / UX Requirements

### Login Page
- "Sign in with Google" button alongside existing login methods
- Google branding guidelines compliant button
- Clear separation between Google login and email/password login

### Post-Login
- On first Google login, prompt user to complete profile if needed (name, preferences)
- Redirect to the application's default post-login page

### Error States
- "Google sign-in was cancelled" (user denied consent)
- "Unable to connect to Google. Please try again." (network/API error)
- "This Google account is already linked to another user." (edge case)

## Error States

1. **User denies consent**: Redirect to login page with message "Google sign-in was cancelled."
2. **Google API error**: Display "Unable to connect to Google. Please try again later."
3. **Account linking conflict**: If Google email matches a different existing account, display a message and offer account linking flow (or error).
4. **Misconfigured OAuth**: In development, display a clear error indicating OAuth credentials are missing.
5. **Network failure during callback**: Handle gracefully — the OAuth flow should be resumable.

## Empty States

- Not applicable for this feature.

## Security Requirements

1. OAuth state parameter validated on callback to prevent CSRF
2. Google ID token verified server-side (never trust client-side tokens)
3. Client ID and secret stored in environment variables (never in code)
4. HTTPS enforced for OAuth callback URLs in production
5. PKCE flow used (recommended) to prevent authorization code interception
6. Minimal scopes requested (openid, email, profile — no additional scopes without justification)
7. User's Google password is never accessed or stored
8. Revocation: users can disconnect Google from their account

## Testing Requirements

1. **Unit tests** for:
   - Google ID token verification
   - Account creation/linking logic
   - OAuth state validation

2. **Integration tests** for:
   - Complete OAuth flow (using Google's test accounts or mocked OAuth)
   - New user creation via Google login
   - Existing user login via Google (email match)
   - Error handling (denied consent, API errors)
   - Logout clears session

3. **E2E tests** for:
   - "Sign in with Google" button visible and functional
   - Complete login flow in a test environment

**Coverage target**: 80% for OAuth logic and account linking.

## Acceptance Criteria

1. Given the login page, when it loads, then a "Sign in with Google" button is visible.
2. Given a user clicking "Sign in with Google," when they complete Google's consent screen, then they are authenticated and redirected to the app.
3. Given a first-time Google login with email `user@example.com`, when authentication completes, then a new account is created with that email.
4. Given an existing account with email `user@example.com`, when the user logs in with Google using the same email, then they are logged into the existing account.
5. Given an authenticated Google user, when they view their profile, then their Google name and avatar are displayed.
6. Given a user who connected Google, when they log out, then both the app session and Google OAuth state are cleared.
7. Given a user who denies Google consent, when the OAuth flow is cancelled, then they are returned to the login page with a clear message.
8. Given misconfigured Google OAuth credentials, when the app starts, then a clear error is logged (not a silent crash).

## Implementation Phases

### Phase 1: OAuth Setup
- **Goal**: Configure Google OAuth and implement callback handling
- **Deliverables**:
  - Google Cloud project and OAuth credentials created
  - Environment variables configured (GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET)
  - OAuth callback route implemented
  - Google ID token verification
  - State parameter for CSRF protection
- **Done when**: OAuth flow completes and returns user info from Google

### Phase 2: Account Integration
- **Goal**: Connect Google authentication to existing user accounts
- **Deliverables**:
  - Account creation for new Google users
  - Account linking for existing users (email match)
  - Profile update with Google name/avatar
  - Session management integration
- **Done when**: Users can sign in with Google and have a working session

### Phase 3: UI and Error Handling
- **Goal**: Complete user-facing implementation
- **Deliverables**:
  - "Sign in with Google" button on login page
  - Error messages for all failure modes
  - Logout clears all session state
  - Account disconnection option in settings
- **Done when**: UI is complete and all error states are handled

### Phase 4: Testing
- **Goal**: Test coverage for OAuth flow
- **Deliverables**:
  - Unit tests for token verification
  - Integration tests for account creation/linking
  - E2E test for login flow
- **Done when**: All tests pass, all acceptance criteria verified

## Verification Commands

```bash
# Install Google OAuth dependency
npm install passport-google-oauth20  # or framework-specific equivalent

# Set environment variables
export GOOGLE_CLIENT_ID=your-client-id
export GOOGLE_CLIENT_SECRET=your-client-secret
export GOOGLE_CALLBACK_URL=https://yourapp.com/auth/google/callback

# Run development server
npm run dev

# Run tests
npm test

# Run linter
npm run lint
```

# Quality Review

| Dimension | Score | Notes |
|-----------|-------|-------|
| Clarity | 4 | Requirements are clear for a standard OAuth integration. Depends on existing auth system details that need repository inspection. |
| Completeness | 3 | Missing: exact existing auth framework, database schema details, and whether account linking UI is needed. |
| Testability | 5 | All acceptance criteria are specific and verifiable. |
| Technical Feasibility | 5 | Standard OAuth integration, well-documented patterns exist for all major frameworks. |
| Scope Control | 4 | Non-goals are clear. Scope is appropriately minimal for a "add Google login" request. |

**Improvements needed:**
1. Repository inspection required to determine existing auth framework and user model.
2. Confirm whether account linking (connecting Google to existing account) is needed as a user-facing flow.

# Approval

Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
