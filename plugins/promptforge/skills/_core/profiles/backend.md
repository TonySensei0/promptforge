# Backend Profile

Use this profile when the request involves API design, server-side logic, data persistence, or backend architecture.

## Additional Review Focus

Apply the base protocol first. Then apply these backend-specific lenses:

### API Contracts

- What endpoints are needed?
- What is the request/response schema for each?
- What HTTP methods are used and are they appropriate?
- What status codes are returned and when?
- How is the API versioned?
- What is the pagination strategy?
- How are errors communicated (format, codes, messages)?
- Is there API documentation (OpenAPI, GraphQL schema)?

### Service Boundaries

- What are the service boundaries?
- Where is the boundary between this service and others?
- What data is owned by this service vs. shared?
- What is the communication protocol between services (HTTP, gRPC, events)?
- What is the coupling level between services?

### Validation

- What inputs need server-side validation?
- What validation rules apply to each field?
- Where does validation occur (controller, service, model)?
- How are validation errors communicated?
- What sanitization is applied?

### Persistence

- What data is persisted and where?
- What is the data model (schema, tables, collections)?
- What ORM or query layer is used?
- What transactions are needed?
- How is data consistency maintained?
- What is the data retention policy?

### Transactions

- What operations require atomicity?
- What is the transaction isolation level?
- How are distributed transactions handled (or avoided)?
- What happens when a transaction fails?
- Are there eventual consistency concerns?

### Concurrency

- What race conditions could exist?
- How are concurrent writes handled?
- What locking strategy is used (pessimistic, optimistic, none)?
- What is the idempotency strategy for retries?
- How is request deduplication handled?

### Observability

- What logs are emitted and at what level?
- What metrics are collected?
- What distributed tracing is needed?
- What health check endpoints exist?
- What alerts should fire for backend failures?
- How are slow queries identified?

### Error Handling

- What error types exist and how are they categorized?
- How are errors propagated through the stack?
- What is the error response format for API consumers?
- How are 5xx errors distinguished from 4xx errors?
- What retry logic applies and where?
- What is the circuit breaker strategy for external calls?

## Backend-Specific Open Questions

Add these questions when relevant:

- What is the expected request volume?
- What is the data retention requirement?
- Are there compliance requirements for data handling?
- What is the disaster recovery RTO/RPO?

## Backend-Specific Non-Goals

Explicitly state:

- What services will not be modified?
- What data stores will not be touched?
- What migration complexity is deferred?
