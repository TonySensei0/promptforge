# Example: Vague Web App Request

## Input

```
make me a dashboard for sales with login and charts
```

## Refinement Output

# Original Request

"make me a dashboard for sales with login and charts"

# Understanding

The developer wants to create a web application with two main features: (1) user authentication (login), and (2) a sales dashboard displaying data as charts. The intended audience appears to be a sales team who needs to visualize sales metrics.

**Alternative interpretations:**
- Interpretation A: A customer-facing sales dashboard (customers view their own purchase history)
- Interpretation B: An internal sales team dashboard (employees view team/company sales metrics)
- Interpretation C: An admin dashboard for managing sales data with charts as one of many features

This refinement proceeds under **Interpretation B** (internal sales team dashboard) as the most common use case, but surfaces this as an assumption.

# Confirmed Requirements

1. User login functionality
2. A dashboard page with charts
3. Sales-related data visualization

# Assumptions

- **Assumption**: This is an internal tool for a sales team, not a customer-facing portal. If it is customer-facing, the data access patterns and security model change significantly.
- **Assumption**: The dashboard will display metrics like revenue, deals closed, conversion rate, or similar standard sales KPIs. Specific metrics were not defined.
- **Assumption**: Login will use email + password. Social login (Google, SSO) was not mentioned but is a common expectation.
- **Assumption**: Charts will show time-series data (daily/weekly/monthly). No specific chart types were requested.
- **Assumption**: The developer is building this from scratch, not adding to an existing system.
- **Assumption**: The sales data source is not yet defined — it may be a database, CSV import, or external API integration.

# Missing Decisions

1. **What metrics should the dashboard display?** (revenue, deals, conversion rate, pipeline, leaderboard?)
2. **Who are the users?** (internal sales team, managers, executives, customers?)
3. **What is the data source?** (database, CSV, external API like Salesforce?)
4. **What authentication method?** (email/password, SSO, OAuth?)
5. **Should charts be interactive?** (filter by date range, drill down?)
6. **Is there a role hierarchy?** (sales reps see own data, managers see team data?)
7. **What is the expected scale?** (number of users, data points, refresh frequency?)
8. **Does this need to be mobile-responsive?**

# Scope

- User authentication (login/logout)
- Dashboard page with at least 3 chart types
- Sales data visualization
- Basic session management
- Responsive layout for desktop and tablet

# Non-Goals

- User registration / signup flow (assumes users are pre-provisioned)
- Password reset functionality (can be added later)
- Real-time data updates (initial version uses polling or manual refresh)
- Advanced analytics or AI-driven insights
- Export to PDF/Excel
- Multi-tenancy or organization support
- Admin panel for user management (beyond basic user CRUD)
- Mobile app (responsive web only)

# Repository Context

N/A — new project. No existing repository to inspect.

**Recommended stack:**
- Frontend: React with a charting library (Recharts or Chart.js)
- Backend: Node.js/Express or Next.js API routes
- Database: PostgreSQL for user and sales data
- Authentication: JWT-based sessions or session cookies
- Styling: Tailwind CSS for rapid development

# Refined Implementation Prompt

## Objective

Build an internal sales dashboard application so that sales team members can visualize key sales metrics through interactive charts, with secure email/password authentication.

## Existing Context

This is a new project. Recommended starting stack:

- **Framework**: Next.js (full-stack React with API routes)
- **Runtime**: Node.js 18+
- **Package Manager**: npm
- **Database**: PostgreSQL with Prisma ORM
- **Authentication**: JWT-based sessions with HTTP-only cookies
- **Charting**: Recharts (React-native charting library)
- **Styling**: Tailwind CSS
- **Testing**: Vitest for unit tests, Playwright for e2e

## User Stories

- As a **sales rep**, I want to log in securely so that I can access my sales data.
- As a **sales rep**, I want to see my sales metrics on a dashboard so that I can track my performance.
- As a **sales rep**, I want to filter charts by date range so that I can focus on specific periods.
- As a **sales manager**, I want to see team-level metrics so that I can monitor overall performance.
- As a **user**, I want to log out so that my session is secure on shared devices.

## Functional Requirements

1. Users can authenticate with email and password
2. Authenticated users are redirected to the dashboard
3. Unauthenticated users are redirected to the login page
4. Dashboard displays at least 3 charts showing sales metrics
5. Users can select a date range to filter chart data
6. Dashboard data refreshes when the date range changes
7. Users can log out from any page
8. Session persists across page refreshes (within a reasonable timeout)

## Technical Constraints

- Built with Next.js (App Router preferred)
- PostgreSQL for data persistence
- Prisma for database access
- Recharts for data visualization
- Tailwind CSS for styling
- JWT stored in HTTP-only cookies (not localStorage)
- Server components where possible, client components only where interactivity is needed

## Data Requirements

**Users table:**
- id (UUID, primary key)
- email (string, unique, indexed)
- password_hash (string)
- name (string)
- role (enum: rep, manager)
- created_at (timestamp)
- updated_at (timestamp)

**Sales table:**
- id (UUID, primary key)
- user_id (UUID, foreign key to users)
- amount (decimal)
- product (string)
- status (enum: pending, won, lost)
- close_date (date)
- created_at (timestamp)
- updated_at (timestamp)

**Indexes:**
- sales(user_id, close_date) — for dashboard queries
- users(email) — for authentication

## API Requirements

- `POST /api/auth/login` — Accepts email/password, returns session cookie
- `POST /api/auth/logout` — Clears session cookie
- `GET /api/auth/me` — Returns current user info
- `GET /api/dashboard/metrics` — Returns aggregated sales metrics for date range
  - Query params: `startDate`, `endDate`, `userId` (optional, for managers)
- `GET /api/sales` — Returns paginated sales records
  - Query params: `page`, `limit`, `startDate`, `endDate`, `status`

All API routes (except login) require authentication.

## UI / UX Requirements

### Login Page
- Centered card layout
- Email and password fields with validation
- Error message on failed login
- Redirect to dashboard on success

### Dashboard
- Header with user name and logout button
- Date range picker (preset: 7 days, 30 days, 90 days, custom)
- Summary cards (total revenue, deals won, conversion rate)
- At least 3 charts:
  - Revenue over time (line chart)
  - Deals by status (pie/donut chart)
  - Deals closed per day/week (bar chart)
- Responsive: stacks vertically on mobile, grid layout on desktop

### Loading States
- Skeleton loaders for chart containers while data loads
- Spinner on login button during authentication

### Navigation
- Top navigation bar with dashboard link and logout

## Error States

1. **Invalid credentials**: Display "Invalid email or password" on login page. Do not reveal which field is wrong.
2. **Session expired**: Redirect to login with "Your session has expired. Please log in again." message.
3. **API failure**: Display "Unable to load dashboard data. Please try again." with a retry button.
4. **No data for date range**: Display empty state (see below) instead of empty charts.
5. **Network error**: Display "Connection lost. Check your internet connection and try again."
6. **Server error (500)**: Display "Something went wrong. Our team has been notified."

## Empty States

1. **No sales data for selected date range**: Display "No sales data available for the selected period." with a suggestion to expand the date range.
2. **New user with no sales**: Display "You have not recorded any sales yet. Start by adding your first deal." with a CTA button.
3. **Dashboard loading**: Show skeleton loaders matching the chart card layout.

## Security Requirements

1. Passwords hashed with bcrypt (cost factor 12+) before storage
2. Session tokens stored in HTTP-only cookies (not accessible to JavaScript)
3. Cookies have `Secure`, `SameSite=Strict`, and appropriate `Max-Age`
4. All API routes (except `/api/auth/login`) require valid session
5. Role-based access: managers can view team data, reps can only view their own
6. SQL injection prevented by using Prisma parameterized queries
7. XSS prevented by React's built-in escaping and CSP headers
8. Rate limiting on login endpoint (5 attempts per 15 minutes per IP)
9. No sensitive data (passwords, tokens) logged
10. CORS configured to same-origin only

## Testing Requirements

1. **Unit tests** for:
   - Password hashing and validation
   - Metric calculation logic
   - Date range filtering logic
   - Role-based access checks

2. **Integration tests** for:
   - Login flow (success, invalid credentials, missing fields)
   - Dashboard data API (with and without data)
   - Logout flow
   - Session expiration

3. **E2E tests** for:
   - Complete login → dashboard → logout flow
   - Dashboard with sample data
   - Date range filtering
   - Manager viewing team data
   - Responsive layout on mobile viewport

**Coverage target**: 80% for critical paths (auth, dashboard data).

## Acceptance Criteria

1. Given a user with valid credentials, when they submit the login form, then they are authenticated and redirected to the dashboard.
2. Given a user with invalid credentials, when they submit the login form, then they see "Invalid email or password" and remain on the login page.
3. Given an authenticated user on the dashboard, when they select a date range, then the charts update to reflect data within that range.
4. Given a dashboard with no sales data for the selected range, when data loads, then an explicit empty state is displayed instead of empty or zero-value charts.
5. Given a manager user, when they view the dashboard, then they can see their own data plus aggregate team data.
6. Given a sales rep user, when they attempt to view another user's data via the API, then the request returns 403 Forbidden.
7. Given a user who clicks logout, when the request completes, then their session is invalidated and they are redirected to login.
8. Given a user whose session has expired, when they make an API request, then they are redirected to the login page with an expiration message.
9. Given the dashboard on a mobile viewport (375px width), when loaded, then the layout stacks vertically and charts remain readable.
10. Given a login attempt rate limit is reached, when the user attempts to log in again, then they see "Too many attempts. Try again in 15 minutes."

## Implementation Phases

### Phase 1: Foundation
- **Goal**: Set up project structure, database, and authentication
- **Deliverables**:
  - Next.js project initialized with TypeScript and Tailwind
  - Prisma schema with users and sales tables
  - Database migration applied
  - Login page with form validation
  - Authentication API routes (login, logout, session check)
  - Session management with HTTP-only cookies
  - Password hashing with bcrypt
- **Done when**: A user can register (seed), log in, and see the dashboard (empty)

### Phase 2: Core Data Layer
- **Goal**: Implement sales data management and API
- **Deliverables**:
  - Sales CRUD API routes
  - Sales record creation form
  - Sales list view with pagination
  - Seed data for testing (sample sales records)
- **Done when**: Authenticated users can create and view sales records via the API

### Phase 3: Dashboard and Charts
- **Goal**: Build the dashboard with data visualization
- **Deliverables**:
  - Dashboard page layout
  - Summary metric cards (total revenue, deals won, conversion rate)
  - Revenue over time line chart
  - Deals by status pie chart
  - Deals closed per period bar chart
  - Date range picker with filtering
  - API route for aggregated dashboard metrics
- **Done when**: Authenticated users see populated charts with interactive date filtering

### Phase 4: Hardening
- **Goal**: Error handling, edge cases, security, and tests
- **Deliverables**:
  - All error states implemented
  - All empty states implemented
  - Rate limiting on login
  - Role-based access enforcement
  - Unit tests for auth and metrics logic
  - Integration tests for API routes
  - E2E tests for login → dashboard → logout flow
  - Lint and typecheck passing
- **Done when**: All tests pass, all acceptance criteria verified

## Verification Commands

```bash
# Install dependencies
npm install

# Set up environment variables
cp .env.example .env.local
# Configure DATABASE_URL in .env.local

# Initialize database
npx prisma migrate dev
npx prisma db seed

# Run development server
npm run dev

# Run tests
npm test

# Run linter
npm run lint

# Run type check
npm run typecheck

# Build for production
npm run build
```

# Quality Review

| Dimension | Score | Notes |
|-----------|-------|-------|
| Clarity | 4 | Requirements are clear. Chart types and specific metrics are defined. Minor ambiguity remains on data source (to be confirmed). |
| Completeness | 4 | All major sections covered. Caching strategy and monitoring are deferred to future phases but noted. |
| Testability | 5 | Every acceptance criterion is specific and verifiable. No vague language. |
| Technical Feasibility | 5 | All requirements are achievable with the recommended stack. No blockers identified. |
| Scope Control | 5 | Scope and non-goals are explicitly defined. Clear boundaries prevent accidental expansion. |

**Improvements needed:** None at this score level. The one open question (data source) is surfaced in Missing Decisions and does not block the initial implementation.

# Approval

Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
