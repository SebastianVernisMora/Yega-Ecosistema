# Repository Guidelines

## Estructura del Proyecto
- Raíz: scripts de orquestación (`bootstrap_yega_api.sh`, `yega_orchestrator.sh`) y documentación compartida (`README.md`, `ECOSISTEMA.md`, `docs/`).
- `Yega-API/`: API en TypeScript con Express (`src/`), Prisma (`prisma/`), contratos OpenAPI (`contracts/`), pruebas (`tests/`).
- `Yega-Cliente/`, `Yega-Tienda/`, `Yega-Repartidor/`: frontends Vite + React (`src/`, `public/`, `docs/`).
- Configuración: variables en `.env` por app; ejemplos en `.env.example` cuando aplique.

## Comandos de Build, Test y Desarrollo
- API
  - `cd Yega-API && pnpm install && pnpm dev`: arranca en modo watch (tsx).
  - `pnpm build && pnpm start`: compila a `dist/` y ejecuta Node.
  - `pnpm test`: ejecuta la suite con Vitest (HTTP con Supertest).
- Frontends
  - `cd <app> && pnpm install && pnpm dev`: levanta Vite en desarrollo.
  - `pnpm build` y `pnpm preview --port <5173|5174|5175>`: build y previsualización.
- Nota: preferimos `pnpm`; mantén consistencia dentro de cada app.

## Estilo de Código y Convenciones
- Lenguajes: TypeScript (ES2022, ESM) en API y frontends.
- Indentación: 2 espacios. Ajusta tu editor para respetarlo.
- Linting: `pnpm lint` en cada app (ESLint 9). Corrige antes del PR.
- Nombres: `kebab-case` para archivos, `PascalCase` para componentes React, `camelCase` para variables/funciones. Rutas de API en `src/routes/` por recurso (ej.: `orders.ts`).

## Guía de Pruebas
- API: pruebas unitarias/integración en `Yega-API/tests/*.test.ts` (ej.: `auth.test.ts`, `orders.test.ts`). Ejecuta con `pnpm test`.
- Frontends: aún sin arnés de pruebas; sugiere Vitest + React Testing Library si agregas cobertura.
- Preferir pruebas enfocadas; mockear red por defecto salvo contra API local.

## Commits y Pull Requests
- Convención recomendada: `tipo(alcance): descripción breve` (ej.: `docs(submodules): añadir STATUS`).
- Commits pequeños y atómicos; referencia issues cuando aplique.
- Usa `.github/pull_request_template.md` e incluye:
  - Resumen, issue vinculada (`Closes #<n>`), alcance/riesgos y checklist.
  - Capturas/GIFs para cambios de UI; ejemplos curl para cambios de API.

## Seguridad y Configuración
- API: `DATABASE_URL`, `JWT_SECRET`, `PORT`, `CORS_ORIGINS` (ver `Yega-API/.env.example`).
- Frontends: define `VITE_API_URL` por app para apuntar a la API.
- Nunca subas secretos reales. Usa archivos de ejemplo y `.env` local.
