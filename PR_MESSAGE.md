## Resumen

Reporte y preparación de entorno post Sprint 1: unificación de variables de entorno, expansión de CORS para frontends locales, y verificación completa de la suite de tests de la API (25/25). Se agrega reporte general en docs.

## Issue vinculada

Closes #<número-de-issue>

## Cambios
- API: sincronizado `Yega-API/.env` con valores base de desarrollo (`NODE_ENV`, `PORT`, `DATABASE_URL`, `JWT_SECRET`).
- API: ampliado `CORS_ORIGINS` para `localhost` y `127.0.0.1` en puertos `3000`, `3001`, `5173`, `5174`, `5175`.
- API: actualizado `Yega-API/.env.example` con los mismos orígenes CORS.
- Frontends: verificado `VITE_API_URL=http://127.0.0.1:3001` en `Yega-Cliente`, `Yega-Tienda`, `Yega-Repartidor`.
- Repartidor: añadido `Yega-Repartidor/.env.example` con `VITE_API_URL`.
- Docs: agregado `docs/REPORTE_GENERAL_POST_SPRINT_1.md` con resumen de avances y resultados.
- QA: ejecutada suite de `Yega-API` con Vitest: 6 archivos / 25 tests, todos OK.

## Alcance / Riesgos
- Bajo: cambios de configuración y documentación; no se tocan rutas ni lógica de negocio.
- Verificar que entornos locales tengan MySQL accesible si se corre la API real (tests usan Supertest con app en memoria).

## Checklist
- [x] PR listo para revisión
- [x] Pruebas/Smoke básicos (Vitest API: 25/25)
- [x] Documentación actualizada (reporte en `docs/`)

---

Automatización: al incluir "Closes #<n>" este PR actualizará el `Status` del Issue en el Project v2 correspondiente.
