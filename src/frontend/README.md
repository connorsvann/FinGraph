# FinGraph Frontend

The frontend for **FinGraph** is a real-time single-page application built with React 19, TypeScript, Vite, Material UI, Cytoscape.js, and React Flow. It renders interactive network views of financial accounts and transactions, allowing analysts to inspect graph topologies and fraud risk alerts live.

---

## Project Structure

```text
src/frontend/
├── public/              # Static assets
├── src/
│   ├── assets/          # Icons, images, and static graphics
│   ├── components/      # UI components
│   │   ├── common/      # Navbars, sidebars, metric cards
│   │   ├── graph/       # Graph viewers, node inspection, layout controls
│   │   └── fraud/       # Fraud alert feeds, gauge charts, risk summaries
│   ├── hooks/           # Custom React hooks (useGraphData, useFraudAlerts)
│   ├── pages/           # High-level views (Dashboard, GraphExplorer, FraudAnalysis)
│   ├── services/        # API clients (Axios) and SignalR hub connections
│   ├── store/           # Client-side state containers
│   ├── theme/           # Material UI theme overrides
│   ├── types/           # TypeScript interfaces and types
│   └── utils/           # Math & graph layout helper functions
├── package.json
├── tsconfig.json
└── vite.config.ts
```

---

## Development Commands

Execute these commands from `src/frontend`:
```bash
# Install dependencies
npm install

# Start local dev server (port 5173)
npm run dev

# Perform TypeScript check and build production bundles
npm run build

# Preview production build locally
npm run preview
```

---

## API & Websocket Integration

- **REST Client**: Configured in `src/services/api.ts` pointing to `http://localhost:5000/api`.
- **Real-Time Pipeline**: Configured in `src/services/signalRService.ts` listening to `http://localhost:500/hubs/fraudAlerts` for live updates.