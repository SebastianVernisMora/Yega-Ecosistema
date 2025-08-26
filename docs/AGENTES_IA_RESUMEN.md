# Agentes IA — Guía Consolidada por Repo/Agente/Tarea (sin Blackbox / sin Warp)

Este resumen valida y unifica los MDs de agentes existentes (Gemini, Codex, Jules) en el ecosistema Yega. Aplica la política: sin cambios cross‑repo directos, un PR por tema, y footer en commits: `AI-Usage: gemini=0, codex=0, jules=0, blackbox=0`.

## Ecosistema (raíz)
- Gemini: no implementa código aquí; solo creación/edición de documentación y plan de trabajo.
- Codex: mantiene docs orquestadoras (p. ej., `AGENTS.md`, planes en `docs/`).
- Jules: crea issues/PRs de coordinación y handoffs cross‑repo.

## Yega-API (API en Express TS)
- Jules — Contrato y base de servidor
  - Tareas: actualizar `contracts/openapi.yaml`, definir `ERRORS` si aplica, generar mocks mínimos, esqueleto de rutas en `src/routes/`.
  - Comandos: `pnpm dev`, `pnpm build`, `pnpm test`.
- Gemini — QA y pulido
  - Tareas: alinear tipos menores, mejorar mensajes de error, ajustar validación OpenAPI, estabilizar pruebas.
  - Comandos: `pnpm lint && pnpm test` (Vitest + Supertest).
- Codex — Último filtro y PR
  - Tareas: revisión final, plan de rollback, PR con ejemplos curl; actualización de README/env si aplica.

- Jules — Autenticación y flujo base
  - Tareas: `Login` (#14), `Registro` (#15), integrar `VITE_API_URL`, hooks de datos (React Query), formularios (React Hook Form + Zod).
  - Comandos: `pnpm dev`, `pnpm build`, `pnpm lint`.
- Gemini — Pulido UI/TS
  - Tareas: ajustes de tipado menores, accesibilidad básica, manejo de errores de red.
- Codex — PR y validación final
  - Tareas: PR con capturas/GIF; checklist de errores; revisión final del diff.

- Jules — Panel y detalle de pedido
  - Tareas: `DashboardTienda` (#7), `PedidoDetalle` (#9), estados de pedido desde API (#20), placeholders si la API no está lista.
- Gemini — Refactor y consistencia
  - Tareas: normalizar componentes UI, estados vacíos/loading, memoización básica.
- Codex — PRs y handoffs
  - Tareas: PR con flujos y dependencias hacia API (#20).

- Jules — Flujo de entrega
  - Tareas: `RutaEntregaScreen` (#13), lista de pedidos disponibles, transición de estados (asignado → en ruta → entregado).
- Gemini — Pulido y manejo de errores
  - Tareas: control de reintentos/red, sincronización mínima offline si procede.
- Codex — PRs y riesgos
  - Tareas: PR con notas de cobertura manual y escenarios de borde.

## Reglas operativas (aplican a todos)
- No cross‑repo: si un cambio afecta otro repo, documentar dependencia en comentarios del issue y en el PR.
- Branches: `feat/<feature>` o `docs/<tema>` contra `dev`.
- PRs: usar plantilla `.github/pull_request_template.md` y “Closes <repo>#<n>”.
- Herramientas adicionales (solo bloqueo): Blackbox, Qwen Coder o Warp para análisis profundo o filtros extra.

## Matriz rápida (repo → agente → foco)
  
  
- API → Jules: contrato/endpoints; Gemini: calidad/QA; Codex: PRs.
- Cliente → Jules: auth/flujos base; Gemini: pulido; Codex: PRs.
- Tienda → Jules: dashboard/detalle; Gemini: consistencia; Codex: PRs.
- Repartidor → Jules: flujo de entrega; Gemini: robustez/pulido; Codex: PRs.