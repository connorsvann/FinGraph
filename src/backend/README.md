# FinGraph Backend API

The backend for **FinGraph** is designed following Clean Architecture principles using .NET 9 Web API. It handles entity persistence, asynchronous event distribution, caching, and graph computations.

---

## Layered Architecture

```text
src/backend/
├── FinGraph.Domain/         # Core Domain Entities, Value Objects, Graph Data Structures
├── FinGraph.Application/    # Use Cases, Interfaces, DTOs, Graph Detection Algorithms
├── FinGraph.Infrastructure/ # Database (EF Core), Redis, RabbitMQ, and Graph Engine implementations
└── FinGraph.Api/            # REST Controllers, SignalR Hubs, and Middleware
```

---

## Dependency Flow

$$\text{Api} \longrightarrow \text{Infrastructure} \longrightarrow \text{Application} \longrightarrow \text{Domain}$$

- `FinGraph.Domain`: Pure C# domain logic. Contains `Account`, `Transaction`, `FraudAlert`, and `FinancialGraph` structures.
- `FinGraph.Application`: Defines interfaces (`IFinGraphDbContext`, `IGraphEngine`), CQRS commands/queries, and graph algorithms (`CycleDetection`, `ConnectedComponents`, `SuspiciousPathFinder`, `PageRankRiskAnalyzer`).
- `FinGraph.Infrastructure`: EF Core mappings for PostgreSQL 17, Redis cache implementations, RabbitMQ event consumers, and memory projections.
- `FinGraph.Api`: Controllers (`GraphController`, `FraudDetectionController`), SignalR `FraudAlertHub`, and custom exception handling.

---

## Execution & EF Core Commands

Executes commands from `src/backenc`:
```powershell
# Build entire solution
dotnet build FinGraph.slnx

# Run API host
dotnet run --project FinGraph.Api/FinGraph.Api.csproj

# Add EF Core Migration
dotnet ef migrations add <MigrationName> --project FinGraph.Infrastructure --startup-project FinGraph.Api

# Update Local Database
dotnet ef database update --project FinGraph.Infrastructure --startup-project FinGraph.Api
```