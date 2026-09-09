# PromptForge: Refine MongoDB

MongoDB-specific database design, optimization, and administration. Covers document design, aggregation pipelines, indexing, sharding, and MongoDB-specific features.

## Usage

```
PromptForge: Refine MongoDB
```

Then describe the MongoDB work needed:

```
Design a document schema for an e-commerce catalog
Optimize an aggregation pipeline for analytics
Plan sharding strategy for 100M+ documents
Design a multi-tenant application schema
```

## What This Does

This command activates the PromptForge MongoDB methodology, which:

1. **Understands** the MongoDB requirements
2. **Designs** document schemas with embedding/referencing strategy
3. **Plans** aggregation pipelines and indexes
4. **Configures** sharding, replication, and security
5. **Stops** at an approval gate — does not modify databases

## MongoDB-Specific Analysis

### Document Design
- Embedding vs. referencing decisions
- Document size optimization
- Schema patterns (one-to-few, one-to-many, one-to-squillions)
- Denormalization strategy
- Array usage and limits

### Data Modeling Patterns
- Attribute pattern for variant data
- Bucket pattern for time-series
- Outlier pattern for large arrays
- Computed pattern for pre-aggregation

### Indexing
- Single field, compound, multikey indexes
- Text search indexes
- TTL indexes for expiration
- Wildcard indexes for flexible schemas
- Covered queries

### Aggregation Pipeline
- Pipeline stage optimization
- $lookup for joins
- $facet for multi-dimensional analysis
- Memory management (allowDiskUse)

### Sharding
- Shard key selection (cardinality, distribution)
- Hashed vs. ranged sharding
- Zone sharding
- Chunk management

### Replication & HA
- Replica set configuration
- Write concern levels (w:1, w:majority, w:all)
- Read preference strategies
- Read concern levels

### Security
- SCRAM and x.509 authentication
- Role-based access control (RBAC)
- Schema validation rules
- Encryption at rest and in transit

## Output

The refinement produces a structured MongoDB plan with:
- Document schema with types and validation
- Index specifications with rationale
- Aggregation pipeline designs
- Sharding strategy
- Replica set configuration

## After the Plan

Review the MongoDB plan. Reply with `approve` to begin implementation, or ask for modifications.
