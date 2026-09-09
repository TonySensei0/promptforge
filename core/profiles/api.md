# API Design Profile

Use this profile when the request involves API design, API contracts, versioning, documentation, or API architecture decisions.

## Additional Review Focus

Apply the base protocol first. Then apply these API-specific lenses:

### API Style Selection

- Should this be REST, GraphQL, gRPC, WebSocket, or Webhook?
- What are the tradeoffs of each style for this use case?
- What existing API style does the project use?
- Is there a need for multiple API styles?

### Endpoint Design

- What are the resource naming conventions (plural, singular, hierarchy)?
- What HTTP methods are used and are they semantically correct?
- What is the request/response schema for each endpoint?
- What HTTP status codes are returned and when?
- What is the pagination strategy (offset, cursor, keyset)?
- How are filtering and sorting handled?
- How does sparse fieldset work?

### API Versioning

- What versioning strategy applies (URL path, header, content negotiation)?
- What constitutes a breaking change vs. additive change?
- What is the deprecation timeline for old versions?
- How do clients migrate between versions?

### Error Handling

- What is the consistent error response format?
- What machine-readable error codes are used?
- How are validation errors communicated (field-level details)?
- What happens on rate limit (headers, retry-after)?
- How are 4xx and 5xx errors distinguished?

### Authentication and Authorization

- What auth mechanism applies (API keys, OAuth 2.0, JWT, mTLS)?
- What scope or permission model is needed?
- How are tokens issued, refreshed, and revoked?
- What rate limits apply per client?

### Documentation

- What OpenAPI/GraphQL schema documentation is needed?
- What request/response examples are required?
- Is SDK generation needed?
- What is the API documentation workflow?

### Rate Limiting and Throttling

- What are the rate limits per endpoint?
- What headers communicate rate limit status?
- What is the backoff strategy?
- How are burst requests handled?

## API-Specific Open Questions

- What is the expected API consumer base (internal, external, public)?
- What SLA applies to the API?
- What is the API governance model?
- Are there partner or third-party integrations?

## API-Specific Non-Goals

- What API versions are out of scope?
- What endpoints are deferred?
- What API governance is not implemented now?
