# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

**Yega-Ecosistema** is a monorepo that orchestrates the development of the Yega platform, a food delivery service. The ecosystem is composed of a central API and three frontend applications, each targeting a specific user role.

**Current Phase: S1 API/Infra** - Focused on API contract definition and infrastructure documentation.

## Repository Structure

This is a Git submodule-based monorepo with the following components:

| Component | Path | Description |
|-----------|------|-------------|
| **API** | `Yega-API/` | Central API serving all client applications |
| **Client App** | `Yega-Cliente/` | Web app for customers placing orders |
| **Store App** | `Yega-Tienda/` | Web app for stores managing inventory and orders |
| **Driver App** | `Yega-Repartidor/` | Web app for drivers managing deliveries |

## Essential Commands

### Repository Setup
```sh
# Clone and initialize all submodules
git clone <REPO_URL>
cd Yega-Ecosistema
git submodule init
git submodule update --recursive
```

### Frontend Applications (Cliente/Tienda/Repartidor)
All frontend apps use identical technology stack and commands:

```sh
# Navigate to any frontend app
cd Yega-Cliente  # or Yega-Tienda or Yega-Repartidor

# Install dependencies
npm install

# Development server
npm run dev

# Build for production
npm run build

# Build for development
npm run build:dev

# Lint code
npm run lint

# Preview production build
npm run preview
```

### Testing Individual Components
```sh
# Test single frontend app build
cd Yega-Cliente && npm ci && npm run build

# Verify API contracts
cd Yega-API && cat contracts/openapi.yaml
```

## Technology Stack

### Frontend Applications
- **Build Tool**: Vite
- **Framework**: React 18 with TypeScript
- **UI Framework**: shadcn/ui (Radix UI primitives)
- **Styling**: Tailwind CSS with custom configuration
- **Forms**: React Hook Form with Zod validation
- **State Management**: TanStack Query (React Query)
- **Routing**: React Router DOM
- **Charts**: Recharts
- **Themes**: next-themes for dark/light mode

### API
- **Specification**: OpenAPI 3.0.0 (located in `Yega-API/contracts/openapi.yaml`)
- **Authentication**: Bearer token-based
- **Pagination**: Query parameters (`?page`, `?limit` max 50) with `X-Total-Count` header

## AI Agent Orchestration Workflow

This project follows a specific AI agent workflow that must be understood when making contributions:

### Agent Hierarchy
1. **Gemini CLI**: Large changes and initial development
2. **Codex CLI**: Code review and style improvements
3. **Jules**: Final review, PR preparation, and cross-repo handoffs
4. **Blackbox**: Complex technical implementations

### Key Rules
- **One PR per topic/feature**
- **No cross-repo direct changes** - use handoffs documented in text
- **AI Usage footer required** in all commits: `AI-Usage: gemini=0, codex=0, jules=0, blackbox=0`
- All work done in feature branches (`feat/<name>`, `docs/<name>`) merged to `dev` via PR
- `main` branch is protected

## Development Workflow

### Branch Strategy
- **Main branch**: `main` (protected)
- **Development branch**: `dev` 
- **Feature branches**: `feat/<feature-name>`, `docs/<doc-name>`

### Pull Request Requirements
Based on `.github/pull_request_template.md`:
- [ ] Single objective/topic
- [ ] Self-contained diff with no cross-repo changes
- [ ] Risk assessment and rollback plan described  
- [ ] Follows style conventions
- [ ] Handoffs ready if applicable
- [ ] AI-Usage footer included

### Cross-Repository Handoffs
Changes affecting multiple repos must be:
1. Documented in this orchestration repo first
2. Transferred as issues/PRs to target repositories
3. Never implemented directly across repos

## API Contract Management

The API contract is centrally managed in `Yega-API/contracts/openapi.yaml`:

### Key Endpoints
- Authentication: `/auth/login`, `/auth/register`
- Catalog: `/catalog` (public)
- Orders: `/orders` (authenticated)
- Order details: `/orders/{orderId}`

### Order States Flow
```
pending → accepted → preparing → assigned → on_route → delivered | canceled
```

### Authentication
- **Format**: `Authorization: Bearer <token>`
- **Error Handling**: Clear distinction between 401 (Unauthorized) and 403 (Forbidden)

## Frontend Architecture Patterns

### Common Structure (All Apps)
```
src/
├── components/          # Reusable React components
│   ├── ui/             # shadcn/ui components  
│   └── dashboard/      # App-specific components
├── hooks/              # Custom React hooks
├── lib/                # Utility functions
├── pages/              # Main application pages
├── App.tsx             # Main app component with routing
└── main.tsx            # Application entry point
```

### Authentication Integration
All apps implement authentication via:
- `src/lib/api.ts`: Axios client with baseURL from `VITE_API_BASE_URL`
- `src/hooks/useAuth.ts`: React Query hooks for login/register
- Environment config in `.env` (copy from `.env.example`)

### App-Specific Features

#### Yega-Tienda (Store App)
- Dashboard with order management
- Inventory management
- Statistics and analytics
- Store profile management

#### Yega-Repartidor (Driver App)  
- Driver registration and document management
- Order acceptance and delivery management
- Route navigation
- Earnings tracking
- Vehicle document handling

#### Yega-Cliente (Client App)
- Product catalog browsing
- Order placement and tracking  
- User profile management

## Configuration Management

### Environment Variables
All frontend apps require:
```sh
# Copy example and configure
cp .env.example .env

# Required variables
VITE_API_BASE_URL=https://api.stg.yega.com.mx  # or production URL
```

### API Configuration
- **Staging**: `https://api.stg.yega.com.mx`
- **Production**: `https://api.yega.com.mx`
- **CORS**: Configured per environment (see API documentation)

## Important Documentation References

- **Agent orchestration**: `docs/agents/AGENTS.md`
- **API specification**: `Yega-API/contracts/openapi.yaml`
- **Per-app jules.md files**: Contains PR preparation instructions for each component

## Project Phase Context

Currently in **S1 API/Infra** phase focusing on:
- Consolidating `openapi.yaml` specification
- Defining error models (`ERRORS.md`)  
- Documenting CORS configuration and deployment playbooks
- Establishing handoff processes between components

The orchestration repository is used for documentation, planning, and coordination artifacts - **no application code is written here directly**.
