# Performance Profile

Use this profile when the request involves performance-critical systems, data processing, or anything where speed and resource usage matter.

## Additional Review Focus

Apply the base protocol first. Then apply these performance-specific lenses:

### Latency

- What is the target response time for each operation?
- What is the P50, P95, and P99 latency requirement?
- Where are the critical user-facing latency paths?
- What operations can be asynchronous vs. synchronous?
- What is the acceptable latency for background operations?

### Throughput

- What is the expected request rate?
- What is the peak load expectation?
- Where are throughput bottlenecks?
- What can be batched or aggregated?
- What is the queueing strategy for load spikes?

### CPU

- Where are the CPU-intensive operations?
- Can any operations be offloaded or cached?
- What is the CPU budget per request?
- Are there hot paths that could benefit from optimization?
- What profiling approach will identify bottlenecks?

### Memory

- What is the expected memory footprint?
- Where are the memory-intensive operations?
- What is the risk of memory leaks?
- How is memory managed (GC, pooling, manual)?
- What is the maximum acceptable memory usage?

### GPU (Where Relevant)

- What computations benefit from GPU acceleration?
- What is the GPU memory budget?
- How is GPU memory managed?
- What is the CPU-GPU data transfer overhead?
- What fallback exists for systems without GPUs?

### Concurrency

- What operations can run in parallel?
- What shared state requires synchronization?
- What race conditions could exist?
- What is the concurrency model (threads, async, actors)?
- How is backpressure handled?

### Caching

- What data can be cached?
- What is the cache invalidation strategy?
- What cache eviction policy applies?
- Where should caches live (in-process, Redis, CDN, database)?
- How is cache consistency maintained?
- What is the cache hit rate target?

### Database Performance

- What queries are on the critical path?
- What indexes are needed?
- What is the N+1 query risk?
- What connection pooling strategy applies?
- What read/write splitting is needed?
- What query optimization is needed?

### Profiling

- What profiling tools are available?
- Where should profiling be added?
- What metrics define "good" performance?
- What is the performance budget?
- How will performance regressions be detected?

### Benchmarks

- What benchmarks exist or should be created?
- What is the baseline performance?
- How are performance improvements measured?
- What is the acceptable regression threshold?

## Performance-Specific Open Questions

Add these questions when relevant:

- What are the SLA requirements?
- What is the expected growth rate of traffic or data?
- Are there seasonal or event-driven load spikes?
- What is the cost budget for infrastructure?

## Performance-Specific Non-Goals

Explicitly state:

- What performance targets are deferred?
- What optimization is not in scope for this phase?
- What profiling or benchmarking is planned for later?
