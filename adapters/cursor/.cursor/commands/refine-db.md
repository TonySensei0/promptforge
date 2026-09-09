# PromptForge: Refine Database

Design database schemas, plan migrations, optimize queries, and model data for any database system. Database-agnostic methodology with specific guidance for common engines.

## Usage

```
PromptForge: Refine Database
```

Then describe the database work needed:

```
Design a database schema for an e-commerce platform
Plan the migration from MySQL to PostgreSQL
Optimize slow queries on the orders table
Design a multi-tenant data model
```

## What This Does

This command activates the PromptForge database design methodology, which:

1. **Understands** the data requirements
2. **Designs** entity relationships and schema
3. **Plans** migrations with rollback strategies
4. **Optimizes** indexes and query patterns
5. **Stops** at an approval gate — does not create database objects

## Database Design

### Data Modeling
- Entity identification and relationships
- Normalization vs. denormalization
- Primary key strategy
- Soft deletes and audit fields

### Schema Design
- Table/collection naming conventions
- Column types and constraints
- Foreign keys and referential integrity
- Index strategy

### Migrations
- Versioned migration plan
- Zero-downtime migration strategy
- Rollback procedures
- Data migration approach

### Query Optimization
- Common query patterns
- N+1 prevention
- Pagination strategy
- Aggregation design

### Scalability
- Read scaling (replication, caching)
- Write scaling (sharding, partitioning)
- Data archiving strategy

## Output

The refinement produces a structured database plan with:
- Complete schema design
- Relationship diagrams
- Migration plan with rollback
- Index recommendations
- Query optimization plan

## After the Plan

Review the database plan. Reply with `approve` to begin implementation, or ask for modifications.
