# PostgreSQL Profile

Use this profile when the request involves PostgreSQL database design, optimization, administration, or PostgreSQL-specific features (extensions, JSONB, CTEs, partitioning, RLS).

## Additional Review Focus

Apply the base protocol first. Then apply the general database profile from `profiles/db.md`. Then apply these PostgreSQL-specific lenses:

### PostgreSQL Data Types

- Where do native types (UUID, JSONB, INET, CIDR, ARRAY, RANGE) apply?
- How is JSONB used vs. structured columns?
- Are arrays used for multi-value attributes?
- Are range types used for time intervals or numeric ranges?
- Is PostGIS needed for spatial data?

### Advanced Query Features

- How are CTEs (WITH clauses) used for query readability?
- Where do window functions replace subqueries?
- How are LATERAL joins used for correlated subqueries?
- Is UPSERT (ON CONFLICT) used for idempotent writes?
- Is RETURNING used to avoid extra queries?

### Indexing Strategy

- What B-tree indexes cover equality and range queries?
- What GIN indexes cover JSONB, full-text, and array queries?
- What GiST indexes cover spatial and range data?
- What BRIN indexes cover large, naturally ordered tables?
- Are partial indexes used to limit index size?
- Are expression indexes used for computed values?
- Are covering indexes (INCLUDE) used for index-only scans?

### JSON and Semi-Structured Data

- When is JSONB preferred over structured columns?
- What GIN indexes optimize JSONB queries?
- How is JSONB path navigation optimized?
- How is schema validation handled for JSONB data?

### Advanced Features

- Is Row-Level Security (RLS) used for multi-tenancy?
- What partitioning strategy applies (range, list, hash)?
- Are materialized views used for pre-computed aggregations?
- Is PL/pgSQL used for complex business logic in the database?
- Are triggers used for audit or denormalization?
- Is LISTEN/NOTIFY used for application events?

### Replication and High Availability

- What streaming replication configuration applies?
- Is logical replication used for selective table replication?
- Is PgBouncer used for connection pooling?
- How is load balancing configured for read replicas?

### Extensions

- Is PostGIS needed for spatial data?
- Is pgvector needed for vector similarity search?
- Is pgcrypto needed for cryptographic functions?
- Is pg_stat_statements enabled for query tracking?
- Is uuid-ossp needed for UUID generation?
- Is citext needed for case-insensitive text?

## PostgreSQL-Specific Open Questions

- What PostgreSQL version is used (14, 15, 16, 17)?
- What extensions are required?
- What is the data volume and growth expectation?
- What is the RTO/RPO for database failures?

## PostgreSQL-Specific Non-Goals

- What PostgreSQL versions are not supported?
- What extensions are deferred?
- What advanced features are out of scope?
