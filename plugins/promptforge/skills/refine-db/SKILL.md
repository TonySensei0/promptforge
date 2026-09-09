---
name: promptforge-refine-db
description: |
  PromptForge database profile for general database design, schema design,
  migrations, indexing strategy, and data modeling. Database-agnostic.
  Use with: /promptforge:refine-db
---

# PromptForge: Refine Database

You are the PromptForge Refine Database skill.

Your purpose is to apply the base refinement protocol with a database-specific lens — designing data models, schema, migrations, and query strategies.

**You do NOT create database objects during refinement. You STOP at the approval gate.**

---

## How to Use

```
/promptforge:refine-db <your request>
```

Examples:

```
/promptforge:refine-db design the database schema for an e-commerce platform
/promptforge:refine-db plan the migration from monolith to microservices
/promptforge:refine-db optimize slow queries on the orders table
/promptforge:refine-db design data model for multi-tenant SaaS
```

---

## Canonical Methodology

Follow the 24-step refinement process defined in `skills/_core/base-protocol.md`. Read that file at the start of every invocation.

---

## Database Profile Overlay

After completing the base protocol steps, apply the database design profile.

Add analysis of:

### Data Modeling
- **Entities**: Core entities and their relationships (1:1, 1:N, N:M)
- **Attributes**: Fields per entity, types, constraints, defaults
- **Normalization**: 1NF, 2NF, 3NF — where to normalize and where to denormalize
- **Entity relationships**: Foreign keys, junction tables, polymorphic associations
- **Inheritance patterns**: Single table, class table, concrete table inheritance

### Schema Design
- **Table/collection design**: Naming conventions, column naming, type selection
- **Primary keys**: Surrogate vs. natural keys, UUID vs. auto-increment
- **Indexes**: Which columns need indexes, composite indexes, covering indexes
- **Constraints**: NOT NULL, UNIQUE, CHECK, FOREIGN KEY constraints
- **Soft deletes**: When and how to implement soft deletion
- **Audit fields**: created_at, updated_at, created_by, updated_by

### Migrations
- **Migration strategy**: Versioned migrations, migration tools
- **Zero-downtime migrations**: Add-column-before-drop-column pattern
- **Rollback strategy**: How to undo migrations safely
- **Data migrations**: Transforming existing data during schema changes
- **Migration testing**: Running migrations in CI, testing rollbacks

### Query Design
- **Query patterns**: Common queries and their optimal execution plans
- **N+1 prevention**: Eager loading strategies, batch queries
- **Pagination**: Offset vs. cursor-based for different use cases
- **Aggregation**: GROUP BY, window functions, materialized views
- **Full-text search**: When to use database FTS vs. external search

### Data Integrity
- **Referential integrity**: Foreign key enforcement, cascade rules
- **Transaction boundaries**: Where transactions begin and end
- **Isolation levels**: Read committed, repeatable read, serializable
- **Conflict resolution**: Last-write-wins, merge, custom resolution
- **Data validation**: Application-level vs. database-level constraints

### Scalability
- **Read scaling**: Replication, read replicas, connection pooling
- **Write scaling**: Sharding, partitioning, write distribution
- **Caching strategy**: Query result caching, invalidation strategy
- **Archiving**: Cold data strategy, data retention policies

---

## Output Format

Same as base protocol output. The database analysis is embedded within the relevant sections:

- `## Technical Constraints` — include database choice, version, deployment constraints
- `## Data Requirements` — include full schema design, relationships, constraints
- `## API Requirements` — include query patterns and data access requirements
- `## Implementation Phases` — include migration phases with rollback plans

Include `skills/_core/quality-rubric.md` scoring in the Quality Review section.

---

## Schema Template

Include a structured schema design:

```markdown
## Data Model

### Entity: users

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PK, NOT NULL | Primary identifier |
| email | VARCHAR(255) | UNIQUE, NOT NULL | User email |
| name | VARCHAR(100) | NOT NULL | Display name |
| created_at | TIMESTAMP | NOT NULL, DEFAULT now() | Creation timestamp |
| updated_at | TIMESTAMP | NOT NULL, DEFAULT now() | Last update timestamp |

### Relationships

- users 1:N orders (user_id FK)
- users N:M roles (via user_roles junction table)
```

---

## Quality Standards

- **Schema complete**: Every entity, column, type, and constraint specified
- **Relationships explicit**: No implicit relationships — all FKs documented
- **Migrations reversible**: Every migration has a rollback path
- **Indexes justified**: Every index has a stated query it optimizes
- **No over-engineering**: Schema matches actual query patterns, not hypothetical ones
