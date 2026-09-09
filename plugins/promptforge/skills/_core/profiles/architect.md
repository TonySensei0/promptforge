# Architect Profile

Use this profile when the request involves system design, architecture decisions, or structural changes.

## Additional Review Focus

Apply the base protocol first. Then apply these architect-specific lenses:

### System Boundaries

- Where are the trust boundaries between components?
- What crosses process, network, or service boundaries?
- What internal APIs exist or should be created?
- What external dependencies exist and what happens if they fail?

### Components and Responsibilities

- What are the major components?
- What does each component own?
- Where do responsibilities overlap or conflict?
- Can any components be merged or split?

### Data Flow

- How does data enter the system?
- How does data move between components?
- Where is data transformed, validated, or enriched?
- What are the bottlenecks or hot paths?

### Scalability

- What are the expected load patterns?
- Where are the scaling bottlenecks?
- What can be parallelized?
- What state is shared vs. isolated?
- How does the system handle growth in data volume, users, or request rate?

### Failure Modes

- What happens when a component fails?
- What happens when a downstream service is unavailable?
- Is there graceful degradation?
- Are there single points of failure?
- How is state consistency maintained during failures?

### Architecture Tradeoffs

- What are the alternatives considered?
- What are the tradeoffs of each approach?
- Why is the chosen approach better for this specific context?
- What constraints drove the decision?

### Observability

- What metrics need to be collected?
- What logs are needed for debugging?
- What traces connect distributed operations?
- What alerts should exist?
- How would you debug a production issue in this system?

## Architect-Specific Open Questions

Add these questions when relevant:

- What is the expected scale (users, requests/sec, data volume)?
- What are the availability requirements (uptime SLA)?
- What is the disaster recovery requirement?
- Are there regulatory or compliance constraints on data residency?
- What is the team's operational capability (on-call, SRE, etc.)?

## Architect-Specific Non-Goals

Explicitly state:

- What architecture decisions are out of scope?
- What existing systems will not be touched?
- What scalability concerns are deferred to a future phase?
