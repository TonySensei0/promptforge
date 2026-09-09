---
name: refine-performance
description: |
  PromptForge performance profile for performance-focused refinements.
  Adds analysis of latency, throughput, caching, database performance,
  and profiling. Use with: /refine-performance
---

# Refine Performance

Apply the PromptForge base protocol (from `promptforge/core/base-protocol.md`), then overlay the performance-specific analysis from `promptforge/core/profiles/performance.md`.

After the base protocol output, add performance-focused sections:

- Latency Analysis
- Throughput Analysis
- Resource Assessment
- Concurrency Analysis
- Caching Strategy
- Database Performance
- Profiling and Benchmarks

All base output sections remain. The Refined Implementation Prompt gets performance subsections.

End with: Review the refined implementation prompt. Reply with `approve` to begin implementation, or tell me what to change.
