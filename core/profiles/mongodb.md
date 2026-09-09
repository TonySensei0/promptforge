# MongoDB Profile

Use this profile when the request involves MongoDB database design, optimization, administration, sharding, or MongoDB-specific features.

## Additional Review Focus

Apply the base protocol first. Then apply the general database profile from `profiles/db.md`. Then apply these MongoDB-specific lenses:

### Document Design

- Should data be embedded or referenced?
- What is the maximum document size consideration (16MB limit)?
- What schema pattern applies (one-to-few, one-to-many, one-to-squillions)?
- Where is denormalization appropriate?
- How are arrays used (primitives vs. objects)?
- Is schema validation needed and how is it configured?

### Data Modeling Patterns

- Does the attribute pattern apply for variant data?
- Does the bucket pattern apply for time-series data?
- How are outlier documents with large arrays handled?
- Are computed fields pre-calculated for frequent queries?
- Is the subset pattern used for partial documents?
- Is the extended reference pattern used to avoid $lookup?

### Indexing Strategy

- What single-field indexes optimize equality and range queries?
- What compound indexes optimize multi-field lookups?
- Are multikey indexes used for array fields?
- Is full-text search indexed?
- Are partial indexes used to limit index scope?
- Are TTL indexes used for automatic expiration?
- Are wildcard indexes used for flexible schemas?
- Are covered queries possible with the current index strategy?

### Aggregation Pipeline

- How is the pipeline optimized ($match and $project early)?
- Is allowDiskUse needed for large datasets?
- How are $lookup joins designed (local/foreign, pipeline)?
- Is $facet used for multi-dimensional aggregation?
- Is $bucket/$bucketAuto used for histogram analysis?

### Transactions

- Where are multi-document ACID transactions needed?
- What is the transaction timeout strategy (60s default)?
- How are transient errors handled (retry logic)?
- Is eventual consistency acceptable vs. ACID?

### Sharding

- What shard key provides good cardinality and distribution?
- Should sharding be hashed or ranged?
- Is zone sharding needed for geographic distribution?
- How are jumbo chunks handled?
- What is the shard key strategy for compound keys?

### Replication and High Availability

- What replica set configuration applies?
- What write concern level is needed (w:1, w:majority, w:all)?
- What read preference strategy applies?
- What read concern level is needed?
- How is the oplog sized?

### Security

- What authentication mechanism applies (SCRAM, x.509, LDAP, AWS IAM)?
- What RBAC roles are needed?
- Is schema validation configured?
- Is encryption at rest and TLS in transit enabled?

## MongoDB-Specific Open Questions

- What MongoDB version is used?
- What is the expected document volume?
- Is sharding needed now or planned for the future?
- What is the acceptable replication lag?

## MongoDB-Specific Non-Goals

- What MongoDB versions are not supported?
- What sharding strategy is deferred?
- What aggregation complexity is out of scope?
