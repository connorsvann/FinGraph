# FinGraph: Fraud Detection & Financial Graph Analysis Platform

FinGraph is a full-stack banking simulation and fraud detection platform that utilizes graph theory, discrete mathematics, and transaction pattern analysis to identify suspicious financial behavior in real time.

By modeling the accounts as graph nodes, and transactions as directed weighted edges, FinGraph applies graph algorithms such as cycle detection, connected components, shortest suspicious path analysis, and PageRank centrality scoring, all to expose money laundering schemes, rapid transit loops, and high-risk account networks through an interactive visual frontend.

---

## Tech Stack

- **Backend**: C#, ASP.NET Core 9 Web API, Entity Framework Core
- **Frontend**: React 19, TypeScript, Vite, Material UI, Cytoscape.js / React Flow
- **Database**: PostgreSQL 17
- **Caching**: Redis
- **Messaging**: RabbitMQ
- **Infrastructure**: Docker & Docker Compose
- **Testing**: .NET Testing Ecosystem (xUnit, Moq, FluentAssertions)
- **Tooling**: Modular PowerShell 7+ Automation Scripts

---

## Repository Architecture

```text
FinGraph/
├── .github/         # CI/CD Workflow
├── docker/          # Docker Compose configurations & database initialization
├── docs/            # Technical specifications, API specs, and math formulas
├── scripts/         # Automation scripts (config, windows, linux)
├── src/
│   ├── backend/     # Clean Architecture .NET 9 Web API
│   └── frontend/    # React 19 + TypeScript + Vite SPA
├── tests/           # Unit, Integration, and Functional test suites
├── dev.md           # Developer & Git Workflow Guide
└── README.md
```

---

## Quick Start

### Prerequisites
- [.NET 9 SDK](https://dotnet.microsoft.com/)
- [Node.js (v20+)](https://nodejs.org/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [PowerShell 7+](https://github.com/PowerShell/PowerShell)

### Environment Setup

1. **Clone the repository:**
```powershell
git clone https://github.com/connorsvann/FinGraph.git
cd FinGraph
```

2. **Initialize Environment & Start Services:**
```powershell
.\scripts\windows\dev\setup.ps1
.\scripts\windows\docker\docker-start.ps1
```

3. **Database Migration & Seeding:**
```powershell
.\scripts\windows\database\migrate-db.ps1
.\sciprts\windows\data\seed-db.ps1
```

4. **Launch Application:**
```powershell
.\scripts\windows\dev\start-dev.ps1
```
- **Frontend UI:** `http://localhost:5173`
- **Backend API Docs (Swagger)**: `http://localhost:5000/swagger`

---

## Testing

To execute all unit, integration, and functional tests across the solution:
```powershell
.\scripts\windows\quality\run-tests.ps1
```

For complete development practices, branching conventions, and Git usage, see [dev.md](./dev.md).

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.