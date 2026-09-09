# AI Security Fix Profile

This profile is applied when the developer runs `/refine-ai-security-fix`.
It takes a security audit report as input and produces implementation-ready
fix instructions for each finding.

---

## Objective

Given a PromptForge Security Audit Report, analyze each finding and produce
structured fix instructions — grouped by priority — that a developer can
implement directly.

---

## Input

The developer provides a security audit report (from `/refine-ai-security-audit`).
If no report is provided, instruct the developer to run `/refine-ai-security-audit` first.

---

## Fix Priority

Process findings in this order:

1. **Critical findings first** — fix all Critical issues before any High issues
2. **High findings second** — fix all High issues before Medium
3. **Medium findings third**
4. **Low findings last**

Within each severity level, fix findings in the order they appear in the report.

---

## Fix Output Format

For EACH finding in the audit report, produce:

```markdown
### Fix: [Finding Title]

**Severity**: [Critical / High / Medium / Low]
**Location**: `file/path.ext:line_number`
**Category**: [e.g., Exposed Secrets, Injection]

#### Current Code

```language
[vulnerable code snippet from the audit report]
```

#### Fixed Code

```language
[corrected code snippet]
```

#### Explanation

[Why this fix resolves the vulnerability. Explain the security principle.]

#### Additional Actions

[Any extra steps needed: rotate exposed secrets, update dependencies, add tests, etc.]

#### Verification

[specific steps to confirm the fix works: run a command, check a URL, run a test]

---

### Fix: [Next Finding Title]
[same structure]
```

---

## Batch Fix Mode

If the report contains multiple findings of the same category (e.g., 5 exposed secrets),
group them together:

```markdown
### Batch Fix: Exposed Secrets (3 findings)

| # | Location | Secret Type | Action |
|---|----------|-------------|--------|
| 1 | `src/api.ts:42` | API Key | Move to environment variable |
| 2 | `config/db.js:15` | Database password | Move to .env, add to .gitignore |
| 3 | `src/utils.js:88` | Private key | Rotate key, remove from source, use secret manager |

#### Fix Template

```language
// Before (vulnerable)
const API_KEY = "sk-1234567890abcdef";

// After (secure)
const API_KEY = process.env.API_KEY;
if (!API_KEY) throw new Error("API_KEY environment variable not set");
```

Apply this pattern to all 3 locations listed above.
```

---

## Security Principles Reference

When explaining fixes, reference these principles:

| Principle | Application |
|-----------|-------------|
| **Least privilege** | Grant minimum permissions necessary |
| **Defense in depth** | Multiple layers of security, not just one |
| **Fail securely** | On error, deny access — don't fall back to insecure defaults |
| **Don't trust client input** | Validate and sanitize all user input server-side |
| **Secrets management** | Never commit secrets; use environment variables or secret managers |
| **Secure by default** | Default configurations should be secure, not permissive |
| **Input validation** | Validate type, length, format, and range of all input |
| **Output encoding** | Encode output based on context (HTML, JS, SQL, shell) |
| **Parameterized queries** | Use prepared statements for all database queries |
| **Error handling** | Don't expose internal details in error responses |

---

## Fix Categories

### Exposed Secrets

**Fix pattern**:

1. Remove the secret from source code
2. Store in environment variable or secret manager
3. Add the file to `.gitignore` if not already there
4. Rotate the exposed credential (it must be considered compromised)
5. Check git history and remove if previously committed

```language
// Before
const STRIPE_KEY = "sk_live_51ABC123...";

// After
const STRIPE_KEY = process.env.STRIPE_SECRET_KEY;
if (!STRIPE_KEY) {
  throw new Error("STRIPE_SECRET_KEY environment variable is required");
}
```

### SQL Injection

**Fix pattern**:

1. Replace string concatenation with parameterized queries
2. Use ORM query builders
3. Validate and sanitize all user input

```language
// Before (vulnerable)
const query = `SELECT * FROM users WHERE id = '${userId}'`;

// After (secure)
const query = 'SELECT * FROM users WHERE id = ?';
db.execute(query, [userId]);
```

### Authentication Bypass

**Fix pattern**:

1. Add authentication middleware to all protected routes
2. Verify session/token on every request
3. Return 401 for unauthenticated requests

```language
// Before (no auth check)
app.get('/api/dashboard', (req, res) => {
  res.json(getDashboardData());
});

// After (with auth check)
app.get('/api/dashboard', authenticateToken, (req, res) => {
  res.json(getDashboardData(req.user.id));
});
```

### XSS Prevention

**Fix pattern**:

1. Use framework auto-escaping (React, Vue, Angular auto-escape by default)
2. Never use `dangerouslySetInnerHTML`, `v-html`, `innerHTML` with user data
3. Implement Content-Security-Policy headers
4. Sanitize HTML with a library like DOMPurify if HTML rendering is needed

```language
// Before (vulnerable)
element.innerHTML = userInput;

// After (secure)
element.textContent = userInput;
// Or if HTML is needed:
element.innerHTML = DOMPurify.sanitize(userInput);
```

### Insecure Dependencies

**Fix pattern**:

1. Update the vulnerable package
2. Run tests to verify compatibility
3. If no fix available, evaluate alternatives or implement compensating controls

```bash
# Before
npm install vulnerable-package@1.2.3

# After
npm install vulnerable-package@2.0.0
npm audit fix
```

### Path Traversal

**Fix pattern**:

1. Validate file paths against an allowlist
2. Use path normalization
3. Never concatenate user input into file paths

```language
// Before (vulnerable)
const filePath = `/uploads/${req.query.filename}`;
fs.readFile(filePath, ...);

// After (secure)
const filename = path.basename(req.query.filename);
const filePath = path.join(UPLOAD_DIR, filename);
if (!filePath.startsWith(UPLOAD_DIR)) {
  throw new Error("Invalid file path");
}
```

### Missing Rate Limiting

**Fix pattern**:

1. Add rate limiting middleware
2. Configure limits appropriate to the endpoint
3. Return 429 with Retry-After header

```language
// Express example
import rateLimit from 'express-rate-limit';

const loginLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 5, // 5 attempts
  message: { error: "Too many login attempts. Try again later." }
});

app.post('/api/login', loginLimiter, loginHandler);
```

### Insecure CORS

**Fix pattern**:

1. Replace wildcard `*` with specific allowed origins
2. Never use wildcard with `credentials: true`
3. Validate origin against a whitelist

```language
// Before (insecure)
app.use(cors({ origin: '*', credentials: true }));

// After (secure)
const ALLOWED_ORIGINS = ['https://myapp.com', 'https://admin.myapp.com'];
app.use(cors({
  origin: (origin, cb) => {
    cb(null, ALLOWED_ORIGINS.includes(origin));
  },
  credentials: true
}));
```

---

## Implementation Output

After producing fixes for all findings, provide:

### 1. Fix Summary

```markdown
| Severity | Total | Fixed | Remaining |
|----------|-------|-------|-----------|
| Critical | N | N | N |
| High | N | N | N |
| Medium | N | N | N |
| Low | N | N | N |

**Estimated effort**: [hours/days]
**Recommended order**: [Critical → High → Medium → Low]
```

### 2. Implementation Order

List the exact order in which fixes should be applied:

1. [ ] Fix all Critical findings (list each)
2. [ ] Fix all High findings (list each)
3. [ ] Fix all Medium findings (list each)
4. [ ] Fix all Low findings (list each)

### 3. Verification Steps

```markdown
After applying all fixes:

1. [ ] Re-run security audit: `/refine-ai-security-audit`
2. [ ] Verify no new Critical or High findings remain
3. [ ] Run existing test suite: `[command]`
4. [ ] Deploy to staging and run penetration test
5. [ ] Rotate all exposed credentials
6. [ ] Update SECURITY.md with new security practices
```

### 4. Prevention Recommendations

```markdown
To prevent similar issues in the future:

1. **Pre-commit hooks**: Add secret scanning (e.g., gitleaks, trufflehog)
2. **CI/CD gates**: Run security audit on every PR
3. **Dependency monitoring**: Enable Dependabot or Renovate for CVE alerts
4. **Code review checklist**: Add security review to PR process
5. **Developer training**: Share OWASP Top 10 and secure coding guidelines
6. **AI-generated code review**: All AI-generated code goes through security review before merge
```

---

## Quality Self-Assessment

Score the fix plan on these dimensions (0-5):

1. **Completeness**: Does every finding have a corresponding fix?
2. **Correctness**: Are the fixes actually secure (not just moving the problem)?
3. **Actionability**: Can a developer implement each fix from the instructions alone?
4. **Priority**: Are fixes ordered by severity?
5. **Verification**: Are there clear steps to confirm each fix works?

Any score below 4 requires explanation.
