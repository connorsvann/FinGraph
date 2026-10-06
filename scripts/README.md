# Script Automation & Infrastructure Orchestration

This folder houses cross-platform development automation configurations, helper modules, and execution scripts for **FinGraph**.

---

## Directory Overview

```text
scripts/
├── config/                    # Shared JSON configurations & environment variables
│   ├── settings.json          # Project framework versions and flags
│   ├── ports.json             # Port allocations for API, UI, DB, Redis, RabbitMQ
│   ├── paths.json             # Relative workspace paths
│   └── environment.env        # Local database and infrastructure secrets
├── windows/                   # Windows PowerShell 7+ Automation Framework
│   ├── Common.ps1             # Central loader script importing psm1 modules
│   ├── modules/               # Core reusable PowerShell modules
│   │   ├── Config.psm1        # Dynamic JSON configuration loader
│   │   ├── Logging.psm1       # Color-coded logging formatting
│   │   └── Prerequisites.psm1 # CLI requirement checks
│   ├── data/                  # Seed and clear graph dataset scripts
│   ├── database/              # EF Core migration & database lifecycle scripts
│   ├── dev/                   # Local setup, start, and build scripts
│   ├── docker/                # Container lifecycle commands
│   ├── quality/               # Testing and linting triggers
│   └── utilities/             # Cleanup and synthetic graph generation utilities
└── linux/                     # Reserved for Linux Bash automation scripts
```

---

## How Scripts Work

All execution scripts in `scripts/windows/<category>/` load `Common.ps1` at startup:
```powershell
. "$PSScriptRoot\..\Common.ps1"
```

This loads global runtime variables:
- `$Global:Config`: Access settings parsed from `scripts/config/`.
- `$Global:RepoRoot`: Absolute path to the repository root directory.

## Key Script Commands
| Task                  | PowerShell Command                          |
|-----------------------|---------------------------------------------|
| Verify Environment    | `.\scripts\windows\dev\setup.ps1`           |
| Start Containers      | `.\scripts\windows\docker\docker-start.ps1` |
| Stop Containers       | `.\scripts\windows\docker\docker-stop.ps1`  |
| Apply Migrations      | `.\scripts\windows\database\migrate-db.ps1` |
| Seed Graph Data       | `.\scripts\windows\data\seed-db.ps1`        |
| Run All Tests         | `.\scripts\windows\quality\run-tests.ps1`   |
| Clean Build Artifacts | `.\scripts\windows\utilities\clean.ps1`     |