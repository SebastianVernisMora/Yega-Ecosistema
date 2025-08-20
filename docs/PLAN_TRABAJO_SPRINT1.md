# Plan de Trabajo — Sprint 1

## Objetivo
Cerrar issues clave en el orden que minimiza bloqueos entre API y frontends, asegurando contratos estables y flujos críticos operativos.

## Orden de Cierre (por fases)
- Fase 0 — Preparación
  - Validar `.env` en API (`PORT`, `CORS_ORIGINS`) y `VITE_API_URL` en frontends.
- Fase 1 — Contrato y mocks (desbloquea frontends)
  - Yega-API: #17 Refinar OpenAPI — https://github.com/SebastianVernisMora/Yega-API/issues/17
  - Yega-API: #18 Expandir servidor mock — https://github.com/SebastianVernisMora/Yega-API/issues/18
- Fase 2 — Endpoints críticos de pedidos
  - Yega-API: #19 Crear Pedido — https://github.com/SebastianVernisMora/Yega-API/issues/19
  - Yega-API: #20 Cambiar Estado de Pedido — https://github.com/SebastianVernisMora/Yega-API/issues/20
- Fase 3 — Autenticación en Cliente (dep. F1/F2)
  - Yega-Cliente: #14 Login — https://github.com/SebastianVernisMora/Yega-Cliente/issues/14
  - Yega-Cliente: #15 Registro — https://github.com/SebastianVernisMora/Yega-Cliente/issues/15
- Fase 4 — Flujos basados en estado
  - Yega-Tienda: #9 Detalle de Pedido — https://github.com/SebastianVernisMora/Yega-Tienda/issues/9
  - Yega-Repartidor: #13 Flujo de Entrega — https://github.com/SebastianVernisMora/Yega-Repartidor/issues/13
- Fase 5 — UI/UX y tableros
  - Yega-Cliente: #16 Dashboard, #17 Detalle, #18 Carrito, #19 Confirmación — https://github.com/SebastianVernisMora/Yega-Cliente/issues
  - Yega-Tienda: #7 Dashboard, #8 Kanban DnD — https://github.com/SebastianVernisMora/Yega-Tienda/issues
- Fase 6 — Documentación y handoff
  - Yega-API: #26 Docs — https://github.com/SebastianVernisMora/Yega-API/issues/26
  - Yega-Cliente: #20 Docs — https://github.com/SebastianVernisMora/Yega-Cliente/issues/20
  - Yega-Repartidor: #17 Docs — https://github.com/SebastianVernisMora/Yega-Repartidor/issues/17
  - Yega-Tienda: #11 Docs — https://github.com/SebastianVernisMora/Yega-Tienda/issues/11
- Fase 7 — Operativa/DevOps
  - Yega-API: #2 PM2/CORS, #4 Aplicar en VPS — https://github.com/SebastianVernisMora/Yega-API/issues

## Criterios de Hecho
- API (#17/#19/#20): OpenAPI actualizado; validación activa; Vitest + Supertest en verde; ejemplos curl en PR.
- Cliente (#14/#15): formularios validados; manejo de errores; sesión persistente; smoke manual OK.
- Tienda/Repartidor (#9/#13): UI refleja estados y transiciones; sin 4xx/5xx en consola.
- Docs: endpoints y variables `.env` documentados; `AGENTS.md` actualizado.

## Riesgos y Mitigaciones
- Cambios tardíos en contrato: fijar OpenAPI en Fase 1 y versionar `contracts/openapi.yaml`.
- CORS/ambientes: validar `CORS_ORIGINS` y `VITE_API_URL` antes de Fases 3–5.
- Dependencias cruzadas: usar comentarios “bloqueado por” y el issue de coordinación.

## Seguimiento
- Issue coordinación (ecosistema): https://github.com/SebastianVernisMora/Yega-Ecosistema/issues/10
- En PRs, incluir: `Closes <repo>#<n>` y referencias a dependencias.
