# PromptForge: Refine API

Design a robust API with proper contracts, versioning, authentication, error handling, and documentation. Supports REST, GraphQL, gRPC, and WebSocket APIs.

## Usage

```
PromptForge: Refine API
```

Then describe the API you want to design:

```
Design a REST API for user management with CRUD operations
Create a GraphQL schema for the product catalog
Add rate limiting to the public API
Design webhook endpoints for payment notifications
```

## What This Does

This command activates the PromptForge API design methodology, which:

1. **Understands** the API requirements
2. **Selects** the appropriate API style (REST, GraphQL, gRPC, etc.)
3. **Designs** complete endpoint contracts
4. **Plans** versioning, auth, error handling, and rate limiting
5. **Stops** at an approval gate — does not implement

## API Design

### Style Selection
- **REST**: Resource-oriented, standard HTTP methods
- **GraphQL**: Flexible queries, single endpoint
- **gRPC**: High performance, streaming, protobuf
- **WebSocket**: Real-time bidirectional communication
- **Webhook**: Event-driven callbacks

### Endpoint Design
- Resource naming conventions
- HTTP methods and status codes
- Request/response schemas
- Pagination strategy
- Filtering and sorting

### API Versioning
- Versioning strategy (URL path, header, content negotiation)
- Backward compatibility rules
- Deprecation policy

### Error Handling
- Consistent error response format
- Error codes and messages
- Validation error details
- Rate limit headers

### Authentication
- API keys, OAuth 2.0, JWT, mTLS
- Scope and permission model
- Token management

## Output

The refinement produces a structured API specification with:
- Complete endpoint listing
- Request/response schemas
- Error format specification
- Authentication requirements
- API documentation plan

## After the Design

Review the API specification. Reply with `approve` to begin implementation, or ask for modifications.
