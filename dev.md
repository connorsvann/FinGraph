# Developer Guide & Git Workflow

Welcome to the **FinGraph** development guide. This document provides guidelines for contributing code, modifying system layers, running scripts, and adhering to Git workflows.

---

## Git Branching Strategy

FinGraph uses a structured feature-branch workflow.

### Branch Conventions
- **`main`**: Production-ready code. Direct commits are blocked.
- **`develop`**: Integration branch for upcoming releases.
- **`feature/<short-description>`**: New functionalities or graph algorithms (e.g., `feature/cycle-detection`).
- **`fix/<issue-description>`**: Bug fixes (e.g., `fix/redis-connection-leak`).
- **`refactor/<component>`**: Code restructuring without altering behavior.

### Recommended Git Workflow

1. **Pull latest changes:**
```powershell
git checkout develop
git pull origin develop
```

2. **Create feature branch:**
```powershell
git checkout -b feature/pagerank-algorithm
```

3. **Commit changes incrementally:**
Follow Conventional Commit formats:
- `feat: add PageRank risk score calculator`
- `fix: resolve null reference in TransactionConsumer`
- `docs: update algorithm specs`
- `test: add unit tests for cycle detection`
```powershell
git add .
git commit -m "feat: implement Tarjan's strongly connected components algorithm"
```

4. **Rebase on `develop` before submitting PR:**
```powershell
git fetch origin
git rebase origin/develop
```

5. **Push and create Pull Request:**
```powershell
git push -u origin feature/pagerank-algorithm
```

---

## How to Modify & Extend the Project

### Adding a New Graph Algorithm
1. **Domain Layer (`FinGraph.Domain`)**: Add mathematical primitives or graph properties to `FinancialGraph.cs` or `Node.cs` if needed.
2. **Application Layer (`FinGraph.Application`)**: Create the algorithm implementation inside `FraudDetection/Algorithms/` (e.g., `NewAlgorithm.cs`).
3. **Unit Testing (`tests/FinGraph.Application.UnitTests`)**: Add synthetic graph unit tests in `Algorithms/` ensuring edge cases (graphs with zero cycles, self-loops, disjoint components) are covered.
4. **API Controller (`FinGraph.Api`)**: Expose an endpoint in `FraudDetectionController.cs` or `GraphController.cs`.
5. **Frontend Viewer (`src/frontend`)**: Update `src/services/graphService.ts` and add visualization toggles in `GraphControls.tsx`.

### Adding an EF Core Database Migration

1. Modify entity models in `FinGraph.Domain/Entities/`.
2. Configure entity mappings in `FinGraph.Infrastructure/Persistence/Configurations/`.
3. Run migration command or automation script:
```powershell
.\scripts\windows\database\migrate-db.ps1
```

---

## Pre-Commit Checklist

Before opening a Pull Request, run the local quality checks:
```powershell
# Build backend and frontend
.\scripts\windows\dev\build.ps1

# Run unit and integration tests
.\scripts\windows\quality\run-tests.ps1
```