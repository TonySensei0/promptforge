# PromptForge: Refine MySQL

MySQL/MariaDB-specific database design, optimization, and administration. Covers InnoDB, indexing, replication, performance tuning, and MySQL-specific features.

## Usage

```
PromptForge: Refine MySQL
```

Then describe the MySQL work needed:

```
Optimize slow queries on a 10M row orders table
Set up master-slave replication for read scaling
Design a high-availability MySQL cluster
Migrate from MyISAM to InnoDB
```

## What This Does

This command activates the PromptForge MySQL methodology, which:

1. **Understands** the MySQL requirements
2. **Designs** InnoDB-optimized schema
3. **Plans** indexing and query optimization
4. **Configures** replication and high availability
5. **Stops** at an approval gate — does not modify databases

## MySQL-Specific Analysis

### Storage Engine
- InnoDB configuration and optimization
- Buffer pool sizing
- Transaction isolation levels
- Tablespace management

### Indexing
- B-tree and composite indexes
- Covering indexes
- Full-text search (InnoDB FTS)
- Index maintenance strategy

### Query Optimization
- EXPLAIN analysis
- Join optimization
- Subquery optimization
- Partitioning strategy

### Replication & HA
- Master-slave and group replication
- GTID-based replication
- Semi-synchronous replication
- Failover strategy

### Security
- User management and least privilege
- Authentication methods
- Data-at-rest and in-transit encryption
- Audit logging

### Backup
- mysqldump and XtraBackup
- Point-in-time recovery
- Backup automation

## Output

The refinement produces a structured MySQL plan with:
- InnoDB-optimized schema
- Index recommendations with rationale
- Configuration settings
- Replication topology
- Backup strategy

## After the Plan

Review the MySQL plan. Reply with `approve` to begin implementation, or ask for modifications.
