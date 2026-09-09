# Refine Performance

Apply the standard PromptForge refinement process with performance-specific analysis focusing on latency, throughput, caching, database performance, and profiling.

## Usage

```
/refine-performance <your request>
```

## Instructions

1. Follow the `/refine-build` process completely
2. Then apply the performance lens from `promptforge/core/profiles/performance.md`:
   - Latency analysis (P50, P95, P99 targets)
   - Throughput requirements
   - CPU/memory/GPU resource budget
   - Concurrency model
   - Caching strategy
   - Database performance plan
   - Profiling and benchmarks

3. Add performance-specific sections to the Refined Implementation Prompt:
   - Latency Requirements
   - Throughput Requirements
   - Resource Budget
   - Concurrency Model
   - Caching Strategy
   - Database Performance Plan
   - Profiling Strategy
   - Benchmarks

4. STOP — do not implement
5. Wait for `approve`
