# Example: Vague Mobile App Request

## Input

```
make a fitness app
```

## Refinement Output

# Original Request

"make a fitness app"

# Understanding

The developer wants to build a mobile application related to fitness. The specific features, platform, target users, and business model are entirely unspecified. "Fitness app" could mean workout tracking, nutrition logging, social features, coaching, or any combination.

**Alternative interpretations:**
- Interpretation A: Workout tracking app (log exercises, sets, reps)
- Interpretation B: Run/walk tracking app (GPS routes, distance, pace)
- Interpretation C: Nutrition/calorie tracking app (food logging, macros)
- Interpretation D: All-in-one fitness platform (workouts + nutrition + social)

This refinement proceeds under **Interpretation A + B** (workout tracking + activity tracking) as the core MVP, but surfaces this as an assumption.

# Confirmed Requirements

1. A mobile application related to fitness

# Assumptions

- **Assumption**: The app is for personal fitness tracking, not gym management or personal trainer tools.
- **Assumption**: Target platform is iOS and Android (cross-platform). If native-only, the tech stack changes.
- **Assumption**: Users create their own account (not social-only login).
- **Assumption**: Data is stored locally with optional cloud sync.
- **Assumption**: The MVP focuses on workout logging and activity tracking, not social features, coaching, or marketplace.
- **Assumption**: The app works offline (fitness apps are often used in gyms with poor connectivity).

# Missing Decisions

1. **What platform(s)?** (iOS, Android, both, web?)
2. **Native or cross-platform?** (React Native, Flutter, Swift/Kotlin?)
3. **What fitness features are the priority?** (workout logging, GPS tracking, nutrition, all?)
4. **Does it need a backend?** (for sync, social, coaching?)
5. **What is the monetization model?** (free, freemium, subscription?)
6. **Does it integrate with health platforms?** (Apple Health, Google Fit, wearables?)
7. **What is the target user's fitness level?** (beginner, intermediate, advanced?)
8. **Is there a social/community component?**

# Scope

- Workout logging (exercise name, sets, reps, weight, duration)
- Activity tracking (GPS-based run/walk with distance, pace, duration)
- Progress view (workout history, personal records)
- User account (email/password)
- Offline-first data storage
- Basic data visualization (weekly/monthly activity charts)
- Settings (units, goals, profile)

# Non-Goals

- Social features (following, sharing, leaderboards)
- Nutrition/calorie tracking
- Coaching or workout plans from experts
- Wearable device integration (Apple Watch, Fitbit)
- Apple Health / Google Fit sync
- In-app purchases or subscriptions
- Video workout content
- Community features or challenges
- AI-powered recommendations
- Backend social features

# Repository Context

N/A — new project. No existing repository.

**Recommended stack:**
- **Framework**: React Native (cross-platform, single codebase)
- **Runtime**: Node.js (tooling), Expo for React Native
- **State**: Zustand or Redux Toolkit
- **Local Storage**: SQLite via Expo SQLite or AsyncStorage
- **Charts**: Victory Native or react-native-chart-kit
- **Maps/GPS**: Expo Location
- **Navigation**: React Navigation
- **Testing**: Jest for unit tests, Detox for e2e
- **CI**: EAS Build (Expo Application Services)

# Refined Implementation Prompt

## Objective

Build a cross-platform fitness tracking mobile app so that users can log workouts, track outdoor activities via GPS, and view their progress over time — fully functional offline.

## Existing Context

New project. Recommended stack:

- **Framework**: React Native with Expo
- **Runtime**: Node.js 18+
- **Package Manager**: npm
- **State Management**: Zustand
- **Local Database**: SQLite (via expo-sqlite)
- **Charts**: react-native-chart-kit
- **GPS/Location**: expo-location
- **Navigation**: React Navigation
- **Authentication**: Local auth (no backend for v1)

## User Stories

- As a **new user**, I want to create an account so that my data is saved.
- As a **user**, I want to log a workout (exercise, sets, reps, weight) so that I can track my strength progress.
- As a **user**, I want to start a GPS-tracked activity (run, walk, bike) so that I can see my distance and pace.
- As a **user**, I want to view my workout history so that I can see my progress over time.
- As a **user**, I want the app to work offline so that I can log workouts at the gym without connectivity.
- As a **user**, I want to set a weekly workout goal so that I can stay motivated.

## Functional Requirements

### Account
1. Users can create an account with email and password
2. Users can log in and log out
3. User profile stores name, email, preferred units (metric/imperial), and weekly goal

### Workout Logging
1. Users can create a new workout session
2. Users can add exercises to a workout (name, sets, reps, weight, notes)
3. Users can mark exercises as complete
4. Workouts are timestamped and stored locally
5. Users can view past workout sessions with full detail

### Activity Tracking
1. Users can start a GPS-tracked activity (run, walk, bike)
2. Activity tracks distance, duration, average pace, and route
3. Activity pauses and resumes correctly
4. Activity can be stopped and saved
5. Activities are listed in history with summary stats

### Progress
1. Dashboard shows weekly activity summary (workouts count, total duration)
2. Users can view personal records (heaviest lift, longest run, etc.)
3. Charts show activity trends over the past 30 days

### Settings
1. Users can toggle between metric and imperial units
2. Users can set weekly workout goal (number of sessions)
3. Users can edit their profile

## Technical Constraints

- Offline-first: all data stored locally via SQLite
- No backend required for v1 (data stays on device)
- Cross-platform: iOS and Android from single codebase
- GPS tracking requires location permissions (foreground and background on Android)
- Background tracking has platform-specific limitations
- SQLite schema versioning needed for future migrations

## Data Requirements

**profiles table:**
- id (TEXT PRIMARY KEY)
- email (TEXT UNIQUE)
- name (TEXT)
- password_hash (TEXT)
- units (TEXT: 'metric' | 'imperial')
- weekly_goal (INTEGER)
- created_at (TEXT)

**workouts table:**
- id (TEXT PRIMARY KEY)
- profile_id (TEXT FOREIGN KEY)
- name (TEXT)
- started_at (TEXT)
- ended_at (TEXT, nullable)
- notes (TEXT)
- created_at (TEXT)

**exercises table:**
- id (TEXT PRIMARY KEY)
- workout_id (TEXT FOREIGN KEY)
- name (TEXT)
- sets (INTEGER)
- reps (INTEGER)
- weight (REAL)
- notes (TEXT)
- completed (INTEGER: 0 | 1)
- completed_at (TEXT, nullable)

**activities table:**
- id (TEXT PRIMARY KEY)
- profile_id (TEXT FOREIGN KEY)
- type (TEXT: 'run' | 'walk' | 'bike')
- started_at (TEXT)
- ended_at (TEXT, nullable)
- distance_meters (REAL)
- duration_seconds (INTEGER)
- avg_pace_sec_per_km (REAL, nullable)
- route_points (TEXT: JSON array of {lat, lng, timestamp})
- created_at (TEXT)

## API Requirements

No API for v1. All data is local. Future: cloud sync API.

## UI / UX Requirements

### Onboarding
- Welcome screen with app description
- Account creation or login
- Unit preference selection
- Permission requests (location for activity tracking)

### Dashboard
- Weekly summary cards (workouts completed, total duration, active minutes)
- Weekly goal progress bar
- Quick action buttons (Start Workout, Start Activity)

### Workout Screen
- Exercise list with inline set/rep/weight entry
- Checkbox or tap to mark sets complete
- Timer for rest periods (optional)
- Save and discard controls

### Activity Screen
- Live map view with route
- Live stats overlay (distance, duration, pace)
- Pause/resume controls
- Stop and save flow

### History
- List of past workouts and activities
- Detail view for each session
- Filter by type and date range

### Charts
- Activity frequency (workouts per day) — bar chart, last 30 days
- Activity duration trend — line chart, last 30 days
- Personal records highlight

### Navigation
- Bottom tab bar: Dashboard, Workouts, Activities, Progress, Settings

### Offline Behavior
- All screens functional without connectivity
- Local-only data sync banner (future: cloud sync indicator)
- Graceful degradation when GPS is unavailable

## Error States

1. **Location permission denied**: "Location access is needed for activity tracking. Enable it in Settings." with a deep link to app settings.
2. **GPS signal lost during activity**: Display "GPS signal lost. Tracking paused." Resume when signal returns.
3. **Database error**: Display "Data could not be saved. Please restart the app." with error logging.
4. **Invalid workout data**: "Please fill in at least the exercise name before saving."
5. **Auth failure**: "Invalid email or password."
6. **Storage full**: "Your device storage is full. Some features may not work correctly."

## Empty States

1. **No workouts yet**: "No workouts logged yet. Start your first workout to see it here." with a prominent "Start Workout" button.
2. **No activities yet**: "No activities tracked yet. Start a run or walk to see your routes here."
3. **No progress data**: "Complete a few workouts to see your progress charts."
4. **No exercises in current workout**: "Add an exercise to begin your workout."

## Security Requirements

1. Passwords hashed locally before storage
2. No network transmission of credentials for v1 (local auth only)
3. Location data stored only on device (not transmitted)
4. App uses appropriate permission levels (foreground location minimum, background only if needed)
5. No sensitive data in logs
6. SQLite database stored in app's private storage (not accessible to other apps)

## Testing Requirements

1. **Unit tests** for:
   - Workout data model and calculations
   - Activity distance/pace calculations
   - Personal record detection logic
   - Unit conversion (metric ↔ imperial)

2. **Integration tests** for:
   - SQLite CRUD operations for workouts and activities
   - Authentication flow (login, logout, session)
   - Workout creation and completion flow
   - Activity start/stop/calculate flow

3. **E2E tests** for:
   - Onboarding flow
   - Complete workout logging flow
   - Complete activity tracking flow
   - Offline data persistence
   - Navigation between tabs

**Coverage target**: 70% for data models and core logic.

## Acceptance Criteria

1. Given a new user, when they complete onboarding, then they are on the Dashboard with an empty state and no crashes.
2. Given a user on the Dashboard, when they tap "Start Workout," then they are on the workout screen and can add exercises with sets, reps, and weight.
3. Given a user logging a workout, when they save it, then it appears in their workout history with correct timestamps.
4. Given a user starting an activity with GPS enabled, when they tap "Start," then the GPS begins tracking and the map shows their route in real time.
5. Given a GPS-tracked activity, when the user stops it, then the activity is saved with distance, duration, and route data.
6. Given a user who completed workouts, when they view the Progress tab, then charts display their activity for the past 30 days.
7. Given a user with weekly goal of 3 workouts, when they complete 3 workouts in a week, then the goal progress shows 100%.
8. Given the app in airplane mode, when the user logs a workout, then it is saved locally without errors.
9. Given a user who denies location permission, when they try to start an activity, then they see a clear message explaining why permission is needed with a path to Settings.
10. Given the app on a mobile viewport, when any screen loads, then the layout is usable without horizontal scrolling.

## Implementation Phases

### Phase 1: Foundation
- **Goal**: Project setup, navigation, and data layer
- **Deliverables**:
  - Expo project initialized
  - SQLite database schema and data access layer
  - Authentication (local) with password hashing
  - Bottom tab navigation
  - Basic theme and styling system
- **Done when**: App launches, user can create account, navigation works

### Phase 2: Workout Logging
- **Goal**: Core workout tracking feature
- **Deliverables**:
  - Workout creation screen
  - Exercise entry (name, sets, reps, weight)
  - Exercise completion tracking
  - Workout history list
  - Workout detail view
- **Done when**: Users can create, complete, and review workouts

### Phase 3: Activity Tracking
- **Goal**: GPS-based activity tracking
- **Deliverables**:
  - Activity start/stop with GPS
  - Live map with route
  - Activity stats (distance, pace, duration)
  - Activity history list and detail
  - Location permission handling
- **Done when**: Users can track runs/walks and view saved activities

### Phase 4: Progress and Polish
- **Goal**: Progress visualization and app polish
- **Deliverables**:
  - Dashboard with weekly summary
  - Progress charts (30-day trends)
  - Personal records
  - Settings screen (units, goals, profile)
  - Empty states for all list views
  - Error handling throughout
- **Done when**: Full app experience is functional

### Phase 5: Testing and Hardening
- **Goal**: Quality assurance and edge case handling
- **Deliverables**:
  - Unit tests for data models and calculations
  - Integration tests for SQLite and auth
  - E2E tests for core flows
  - Offline behavior verified
  - Edge cases handled (GPS loss, storage full, etc.)
- **Done when**: All tests pass, all acceptance criteria verified

## Verification Commands

```bash
# Install dependencies
npm install

# Start Expo dev server
npx expo start

# Run on iOS simulator
npx expo run:ios

# Run on Android emulator
npx expo run:android

# Run tests
npm test

# Run linter
npm run lint

# Build for production (EAS)
eas build --platform ios
eas build --platform android
```

# Quality Review

| Dimension | Score | Notes |
|-----------|-------|-------|
| Clarity | 3 | Original request was extremely vague ("make a fitness app"). This refinement defines a concrete MVP but the feature set is an assumption that should be confirmed. |
| Completeness | 4 | Core features, data model, and testing are covered. Social features and backend sync are explicitly deferred. |
| Testability | 5 | All acceptance criteria are specific and verifiable. |
| Technical Feasibility | 5 | Achievable with React Native + Expo. Offline-first with SQLite is well-supported. |
| Scope Control | 4 | Non-goals are clearly defined. However, the scope is still broad (two major features: workouts + activities). Recommend prioritizing one in the initial phase. |

**Improvements needed:**
1. Confirm with the developer whether both workout logging AND activity tracking are needed for v1, or if one should be prioritized.
2. Clarify whether a backend is desired (even if not in v1) to inform data model decisions.

# Approval

Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
