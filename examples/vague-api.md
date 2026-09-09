# Example: Vague API Request

## Input

```
create an api for uploading files
```

## Refinement Output

# Original Request

"create an api for uploading files"

# Understanding

The developer wants to build a file upload API endpoint. The specific details about file types, size limits, storage, authentication, and usage are entirely unspecified.

This is a **highly ambiguous request** that requires significant clarification before implementation.

# Confirmed Requirements

1. An API endpoint that accepts file uploads

# Assumptions

- **Assumption**: Files are stored persistently (not processed in-memory only). If transient processing only, the architecture changes significantly.
- **Assumption**: The upload will be authenticated — allowing unauthenticated uploads is a significant security risk and would be an unusual default.
- **Assumption**: Files are stored locally or in cloud object storage (S3, GCS, etc.), not in the database.
- **Assumption**: Upload size is bounded (unbounded uploads are a denial-of-service risk).
- **Assumption**: Only specific file types are allowed (allowing arbitrary file types is a security vulnerability).
- **Assumption**: This is for an existing project (the request says "create an API," implying addition to an existing system).

# Missing Decisions

1. **What file types are allowed?** (images, documents, archives, any?)
2. **What is the maximum file size?**
3. **Where are files stored?** (local disk, S3, database, another service?)
4. **Who can upload?** (authenticated users only? specific roles?)
5. **Is there a download/retrieval endpoint?**
6. **Are files scanned for malware?**
7. **What happens to existing files when they are replaced?** (overwrite, version, keep both?)
8. **Is there a file metadata requirement?** (filename, original name, MIME type, size stored?)
9. **What should happen on upload failure?** (partial uploads, retry behavior?)
10. **What is the expected upload volume?** (affects storage strategy and scaling)

# Scope

- File upload API endpoint (POST)
- File storage (local filesystem or configured storage backend)
- File metadata persistence (filename, size, MIME type, uploader, timestamp)
- File retrieval endpoint (GET by ID or filename)
- File deletion endpoint (DELETE, authenticated)
- Basic file type validation
- Size limit enforcement
- Upload progress tracking (if feasible)

# Non-Goals

- Image processing or thumbnail generation (can be added as a separate feature)
- Virus/malware scanning (deferred to Phase 2)
- CDN distribution (deferred)
- File sharing or public URLs (uploads are private by default)
- Batch/multi-file upload (single file per request in v1)
- Chunked/resumable uploads (deferred to Phase 2)
- File versioning (uploads overwrite by default)
- Webhook notifications on upload completion

# Repository Context

> ⚠️ **Repository inspection required.** The request says "create an API" which implies an existing project. Before recommending a stack, the repository must be inspected to identify:
>
> - Existing framework and runtime
> - Existing API patterns (REST, GraphQL, tRPC?)
> - Existing authentication system
> - Existing database or ORM
> - Existing file storage patterns
> - Existing test framework

If no repository exists, this is a new project. Recommended default stack:
- **Framework**: Express.js or Fastify (lightweight, API-focused)
- **Runtime**: Node.js 18+
- **File Storage**: Local filesystem with configurable path, or AWS S3 via `@aws-sdk/client-s3`
- **Validation**: Zod for request validation
- **Auth**: Passport.js or existing auth middleware
- **Database**: SQLite or PostgreSQL via Prisma for metadata

# Refined Implementation Prompt

## Objective

Build a file upload API so that authenticated users can upload, retrieve, and delete files through REST endpoints with type validation and size limits.

## Existing Context

> **Requires repository inspection.** The exact stack depends on the existing project. The recommendations below assume a Node.js project.

## User Stories

- As an **authenticated user**, I want to upload a file so that I can store it for later retrieval.
- As an **authenticated user**, I want to retrieve a file I uploaded so that I can download or view it.
- As an **authenticated user**, I want to delete a file I uploaded so that I can remove unwanted files.
- As a **system admin**, I want uploads to be validated so that malicious files cannot be stored.

## Functional Requirements

1. Authenticated users can upload a single file via POST request
2. Uploaded files are stored persistently with unique filenames
3. File metadata (name, size, MIME type, uploader, timestamp) is recorded
4. Authenticated users can retrieve files by ID
5. Authenticated users can delete their own files
6. Uploads are validated: file type must be in an allowed list
7. Uploads are validated: file size must not exceed the configured maximum
8. Upload responses include the file ID and metadata

## Technical Constraints

- Max upload size: **To be confirmed** (recommended default: 10MB)
- Allowed file types: **To be confirmed** (recommended default: images, PDFs, documents)
- Unique filenames generated (UUID-based) to prevent collisions and path traversal
- Original filename preserved in metadata
- Files stored outside the web root to prevent direct access
- All access goes through authenticated API endpoints

## Data Requirements

**files table:**
- id (UUID, primary key)
- original_name (string)
- stored_name (string, unique)
- mime_type (string)
- size_bytes (integer)
- uploader_id (UUID, foreign key to users)
- storage_path (string)
- created_at (timestamp)
- deleted_at (timestamp, nullable for soft delete)

## API Requirements

- `POST /api/files/upload` — Upload a file
  - Headers: `Content-Type: multipart/form-data`
  - Auth: Required
  - Response: `{ id, originalName, mimeType, sizeBytes, createdAt }`
  - Errors: 400 (no file / wrong type / too large), 401 (not authenticated), 413 (too large)

- `GET /api/files/:id` — Retrieve file metadata
  - Auth: Required
  - Response: File metadata object
  - Errors: 404 (not found), 403 (not owner)

- `GET /api/files/:id/download` — Download the file
  - Auth: Required
  - Response: File stream with appropriate Content-Disposition header
  - Errors: 404, 403

- `DELETE /api/files/:id` — Delete a file
  - Auth: Required (owner or admin)
  - Response: 204 No Content
  - Errors: 404, 403

## UI / UX Requirements

No UI requirements for v1. This is a pure API feature. A file upload UI can be added in a follow-up phase.

## Error States

1. **No file provided**: 400 — "No file was provided. Please select a file to upload."
2. **File type not allowed**: 400 — "File type .exe is not allowed. Allowed types: jpg, png, pdf, docx."
3. **File too large**: 413 — "File exceeds the maximum size of 10MB."
4. **Not authenticated**: 401 — "Authentication required."
5. **File not found**: 404 — "File not found."
6. **Not authorized**: 403 — "You do not have permission to access this file."
7. **Storage failure**: 500 — "File upload failed. Please try again."
8. **Partial upload / connection dropped**: Clean up partial file, return 500 — "Upload interrupted. Please try again."

## Empty States

- **User has no files**: `GET /api/files` returns `{ files: [] }` — empty array, no error.

## Security Requirements

1. Authentication required for all endpoints
2. Authorization: users can only access their own files (unless admin)
3. File type validation: whitelist of allowed MIME types (never a blacklist)
4. File extension validation: does not trust Content-Type header alone
5. Size limit enforced before writing to disk (reject early)
6. Unique stored filenames (UUID) to prevent path traversal and guessing
7. Files stored outside web root — no direct URL access
8. Filename sanitization to prevent path traversal in original_name
9. No execution permissions on uploaded files
10. Rate limiting on upload endpoint (prevent abuse)

## Testing Requirements

1. **Unit tests** for:
   - File type validation logic
   - Size validation logic
   - Filename generation
   - MIME type detection

2. **Integration tests** for:
   - Successful upload of allowed file type
   - Rejection of disallowed file type
   - Rejection of oversized file
   - Upload without authentication
   - Retrieval of uploaded file
   - Deletion of uploaded file
   - Accessing another user's file (should 403)

3. **E2E tests** for:
   - Complete upload → retrieve → delete flow
   - Upload with various file types and sizes

**Coverage target**: 80% for upload logic and access control.

## Acceptance Criteria

1. Given an authenticated user with a valid file, when they POST to `/api/files/upload`, then the file is stored and a 200 response includes the file metadata with a generated ID.
2. Given a file of type .exe, when a user attempts to upload it, then the request returns 400 with a message listing allowed types.
3. Given a file larger than the configured maximum, when a user attempts to upload it, then the request returns 413 before any data is written to storage.
4. Given an unauthenticated request to upload, when the request is sent, then the response is 401 Unauthorized.
5. Given a successfully uploaded file, when the owner requests it by ID, then the file metadata and download URL are returned.
6. Given a file uploaded by user A, when user B requests it, then the response is 403 Forbidden.
7. Given a file that exists, when the owner deletes it, then the file is removed from storage and subsequent requests return 404.
8. Given two files with the same original name uploaded by different users, then both files exist with unique stored names and no collision occurs.
9. Given an upload attempt with no file in the request body, then the response is 400 with a clear error message.
10. Given a partially uploaded file (connection dropped mid-transfer), then the partial file is cleaned up and no orphaned files remain in storage.

## Implementation Phases

### Phase 1: Foundation and Upload
- **Goal**: Core upload endpoint with validation and storage
- **Deliverables**:
  - File storage configuration (local path or S3)
  - Upload endpoint with multipart parsing
  - File type validation (MIME type + extension whitelist)
  - File size validation (reject before writing)
  - Unique filename generation (UUID)
  - File metadata persistence
  - Auth middleware integration
- **Done when**: Authenticated users can upload allowed files and receive metadata

### Phase 2: Retrieval and Deletion
- **Goal**: File access endpoints
- **Deliverables**:
  - GET metadata endpoint
  - GET download endpoint with proper Content-Disposition
  - DELETE endpoint with ownership check
  - Soft delete support
- **Done when**: Users can retrieve and delete their own files

### Phase 3: Hardening
- **Goal**: Error handling, edge cases, and tests
- **Deliverables**:
  - All error states implemented
  - Rate limiting on upload endpoint
  - Partial upload cleanup
  - Unit tests for validation logic
  - Integration tests for all endpoints
  - Cleanup script for orphaned files
- **Done when**: All tests pass, all acceptance criteria verified

## Verification Commands

```bash
# Install dependencies
npm install

# Set up environment
cp .env.example .env.local
# Configure UPLOAD_DIR or S3 credentials in .env.local

# Run database migration (if using Prisma)
npx prisma migrate dev

# Create upload directory
mkdir -p uploads

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
| Clarity | 3 | The original request was extremely vague. This refinement defines a solid baseline but requires confirmation on file types, size limits, and storage backend before implementation. |
| Completeness | 4 | All major aspects covered. Virus scanning and CDN are deferred. Malware scanning should be a follow-up priority. |
| Testability | 5 | All acceptance criteria are specific and verifiable. |
| Technical Feasibility | 4 | Feasible with standard tools. Storage backend choice (local vs. S3) needs confirmation. |
| Scope Control | 5 | Clear non-goals prevent scope creep. |

**Improvements needed:**
1. Confirm file types, size limits, and storage backend before Phase 1.
2. Add malware scanning to the roadmap (important for any public-facing upload).

# Approval

Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
