# PromptForge: Refine PostgreSQL

PostgreSQL-specific database design, optimization, and administration. Covers extensions, JSONB, CTEs, window functions, partitioning, row-level security, and PostgreSQL-specific features.

## Usage

```
PromptForge: Refine PostgreSQL
```

Then describe the PostgreSQL work needed:

```
Design a multi-tenant schema with row-level security
Optimize a reporting query with window functions
Set up logical replication for real-time analytics
Design full-text search with pgvector
```

## What This Does

This command activates the PromptForge PostgreSQL methodology, which:

1. **Understands** the PostgreSQL requirements
2. **Designs** schema using PG-specific types (JSONB, arrays, ranges)
3. **Plans** advanced queries (CTEs, window functions, LATERAL joins)
4. **Configures** extensions, partitioning, and RLS
5. **Stops** at an approval gate — does not modify databases

## PostgreSQL-Specific Analysis

### Data Types
- UUID, JSONB, INET, CIDR, ARRAY, RANGE
- JSONB indexing and operators
- Array functions
- Custom enums

### Advanced Queries
- CTEs (WITH clauses) and recursive CTEs
- Window functions (ROW_NUMBER, LAG/LEAD)
- LATERAL joins
- UPSERT with ON CONFLICT
- RETURNING clause

### Indexing
- B-tree, GIN, GiST, BRIN, partial indexes
- Covering indexes (INCLUDE)
- Expression indexes
- Index-only scans

### Advanced Features
- Row-Level Security (RLS) for multi-tenancy
- Partitioning (range, list, hash)
- Materialized views
- LISTEN/NOTIFY for events

### Extensions
- PostGIS for spatial data
- pgvector for vector search
- pgcrypto for encryption
- pg_stat_statements for query tracking

### Replication & HA
- Streaming replication
- Logical replication
- PgBouncer connection pooling
- Read replica load balancing

## Output

The refinement produces a structured PostgreSQL plan with:
- PG-native schema design
- Index strategy with specific index types
- Extension recommendations
- RLS policies for multi-tenancy
- Replication configuration

## After the Plan

Review the PostgreSQL plan. Reply with `approve` to begin implementation, or ask for modifications.
