# MySQL Profile

Use this profile when the request involves MySQL or MariaDB database design, optimization, administration, replication, or MySQL-specific features.

## Additional Review Focus

Apply the base protocol first. Then apply the general database profile from `profiles/db.md`. Then apply these MySQL-specific lenses:

### Storage Engine Selection

- Is InnoDB the right choice for each table?
- When would MyISAM or MEMORY engines be appropriate?
- What is the engine rationale per table?

### InnoDB Configuration

- What is the buffer pool size (recommended: 50-70% of RAM)?
- What is the log file size relative to buffer pool?
- What transaction isolation level applies (READ COMMITTED vs. REPEATABLE READ)?
- How is the redo log configured?
- Is file-per-table or shared tablespace appropriate?

### Indexing Strategy

- What B-tree indexes are needed for equality and range queries?
- What composite indexes optimize multi-column lookups?
- What covering indexes eliminate table access?
- How is InnoDB full-text search configured?
- What is the index maintenance strategy (fragmentation, rebuilds)?

### Query Optimization

- How are EXPLAIN plans read and interpreted?
- What join optimization strategies apply?
- How are subqueries optimized (derived tables, materialization)?
- What partitioning strategy fits the data?

### Replication and High Availability

- What replication topology applies (master-slave, master-master, group)?
- What is the acceptable replication lag?
- What is the failover strategy (automated vs. manual)?
- Is GTID-based replication used?
- Is semi-synchronous replication configured?

### Security

- What user accounts are needed with least privilege?
- What authentication method applies (native vs. caching_sha2)?
- Is encryption at rest and in transit configured?
- Is audit logging enabled?
- What SQL mode is set (STRICT_TRANS_TABLES)?

### Backup and Recovery

- What logical backup tool applies (mysqldump, mysqlpump)?
- What physical backup tool applies (XtraBackup)?
- Is point-in-time recovery configured (binary logs)?
- What is the backup schedule?

## MySQL-Specific Open Questions

- What MySQL version is used (5.7, 8.0, 8.4 LTS)?
- What is the data volume and growth rate?
- What is the RTO/RPO for database failures?

## MySQL-Specific Non-Goals

- What MySQL versions are not supported?
- What replication topologies are deferred?
- What backup strategies are out of scope?
