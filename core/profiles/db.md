# Database Design Profile

Use this profile when the request involves database design, schema design, data modeling, migrations, or database optimization (database-agnostic).

## Additional Review Focus

Apply the base protocol first. Then apply these database-specific lenses:

### Data Modeling

- What are the core entities and their relationships?
- What are the fields per entity with types and constraints?
- What is the normalization level (1NF, 2NF, 3NF)?
- Where should denormalization be applied for performance?
- What inheritance pattern applies (STI, CTI, concrete table)?

### Schema Design

- What are the table/collection naming conventions?
- What is the primary key strategy (surrogate, natural, UUID, auto-increment)?
- What indexes are needed and why?
- What constraints apply (NOT NULL, UNIQUE, CHECK, FK)?
- Is soft delete needed and how is it implemented?
- What audit fields are required (created_at, updated_at, etc.)?

### Migrations

- What migration tool and strategy is used?
- How are zero-downtime migrations handled?
- What is the rollback strategy for each migration?
- How is existing data transformed during schema changes?
- How are migrations tested in CI?

### Query Design

- What are the common query patterns?
- How is N+1 prevented (eager loading, batching)?
- What pagination strategy applies (offset, cursor)?
- What aggregations are needed?
- Is full-text search needed and how is it implemented?

### Data Integrity

- How is referential integrity enforced?
- Where do transactions begin and end?
- What isolation level is appropriate?
- How are conflicts resolved?
- Where does validation happen (app vs. database)?

### Scalability

- How is read scaling handled (replication, read replicas)?
- How is write scaling handled (sharding, partitioning)?
- What caching strategy applies?
- How is cold data archived?

## Database-Specific Open Questions

- What database engine is used or recommended?
- What is the data volume expectation?
- What is the expected growth rate?
- What is the disaster recovery RTO/RPO?

## Database-Specific Non-Goals

- What database engines are out of scope?
- What migrations are deferred?
- What scaling complexity is deferred?
