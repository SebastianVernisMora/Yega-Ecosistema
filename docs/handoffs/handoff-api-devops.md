# Handoff para Repositorio API y DevOps

Este documento contiene el borrador del issue para ser creado en el repositorio `Yega-API`.

---

## Para pegar en: `Yega-API`

**Título del Issue:** `Plan S1: Consolidar Configuración de CORS y Documentación de Despliegue (PM2)`

### Objetivo
Documentar y estandarizar la configuración de despliegue (usando PM2), CORS, el procedimiento de Go-Live y la estrategia de Observabilidad para el API. El objetivo es preparar el terreno para los despliegues en los entornos de `staging` y `producción` de manera consistente y segura.

### Entradas
-   Archivo `docs/CORS-ORIGINS.md` (existente en este repositorio).
-   Endpoints de health check `/health` y `/ready` (actualmente en planificación).

### Tareas
1.  **Crear `docs/PM2-PLAYBOOK.md`:**
    -   **Contenido:** Documentar la configuración completa para correr la aplicación con PM2.
    -   **Detalles:** Debe incluir `app_name`, `script` de inicio, manejo de `variables de entorno` (sin valores secretos), estrategia de `rotación de logs`, política de `restart` y configuración para `zero-downtime reloads`.
    -   **Snippet:** Añadir un ejemplo de `ecosystem.config.js` (o `.json`) como referencia. No debe ser el archivo de despliegue final, sino un template.
2.  **Crear `docs/GO-LIVE.md`:**
    -   **Contenido:** Definir el checklist para un despliegue a producción.
    -   **Detalles:** Incluir pasos de despliegue manual/automatizado, `smoke tests` a ejecutar (ej. llamar a `/health` y `/ready`), y un plan de `rollback` en caso de fallo.
3.  **Crear `docs/OBSERVABILIDAD.md`:**
    -   **Contenido:** Especificar la estrategia de monitoreo de la aplicación.
    -   **Detalles:** Definir las `métricas mínimas` a recolectar (latencia p50/p95, error rate), el formato de `logs` esperado (ej. JSON) y las `alertas` críticas a configurar (ej. alta tasa de errores, latencia elevada).
4.  **Redactar Cuerpo de PR para Devs:**
    -   **Contenido:** Preparar el texto para un Pull Request que un desarrollador usará para entregar los 3 documentos anteriores.
    -   **Detalles:** El cuerpo debe tener un resumen de los cambios, la lista de archivos creados, un checklist de revisión, una sección de riesgos y el plan de rollback.
5.  **Crear Issue de Handoff para Ops:**
    -   **Título:** `[Ops] Aplicar CORS y PM2 en Servidores VPS`
    -   **Contenido:** Crear un issue separado con las tareas de implementación concretas para el equipo de operaciones, detallando los pasos a seguir en el entorno de `staging` y `producción` para configurar PM2 y los orígenes de CORS en el balanceador de carga o proxy inverso.

### Definition of Done (DoD)
- [ ] Los tres documentos (`PM2-PLAYBOOK.md`, `GO-LIVE.md`, `OBSERVABILIDAD.md`) están creados en la carpeta `/docs` del repositorio `Yega-API`.
- [ ] El borrador del cuerpo del PR para los desarrolladores está listo y referenciado en este issue.
- [ ] El issue de handoff para el equipo de Ops está creado, enlazado y listo para ser asignado.
