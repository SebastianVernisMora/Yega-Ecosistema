# Handoffs Index - 2025-08-14

Este documento centraliza los handoffs generados hoy. Contiene una tabla resumen y el texto completo de cada issue para ser copiado en su repositorio correspondiente.

## Tabla Resumen de Handoffs

| Repo Destino      | Título del Issue                                | Objetivo                                         | Estado  | Due Date   |
|-------------------|-------------------------------------------------|--------------------------------------------------|---------|------------|
| `Yega-API`        | [Plan S1: Consolidar CORS y Docs de Despliegue](https://github.com/SebastianVernisMora/Yega-API/issues/2)   | Documentar y estandarizar DevOps (PM2, CORS).    | Creado  | 2025-08-15 |
| `Yega-Cliente`    | [Plan S2: Flujo de Catálogo a Pedido](https://github.com/SebastianVernisMora/Yega-Cliente/issues/2)         | Documentar el plan de la aplicación cliente (rutas, UX, sesión). | Creado  | 2025-08-15 |
| `Yega-Tienda`     | [Plan S3: Tablero de Pedidos y Transiciones](https://github.com/SebastianVernisMora/Yega-Tienda/issues/2)   | Documentar el tablero de la tienda (estados, RBAC). | Creado  | 2025-08-15 |
| `Yega-Repartidor` | [Plan S4: Flujos de Entrega y Base PWA](https://github.com/SebastianVernisMora/Yega-Repartidor/issues/2)    | Documentar los flujos del repartidor y la base PWA. | Creado  | 2025-08-15 |

> Nota de automatización: Al crear nuevos issues de handoff, agrega la etiqueta `sprint-1` y vincula los PRs con palabras de cierre (por ejemplo, “Closes #123”). Esto activará el workflow de Projects v2 para mover el `Status` automáticamente (Todo → In Progress → Done). Consulta la guía en `docs/PROJECTS-AUTOMATION.md`.

---

## Handoffs Listos para Copiar

### Para pegar en: `Yega-API`

**Título del Issue:** `Plan S1: Consolidar Configuración de CORS y Documentación de Despliegue (PM2)`

**Enlace al Issue:** https://github.com/SebastianVernisMora/Yega-API/issues/2

#### Objetivo
Documentar y estandarizar la configuración de despliegue (usando PM2), CORS, el procedimiento de Go-Live y la estrategia de Observabilidad para el API. El objetivo es preparar el terreno para los despliegues en los entornos de `staging` y `producción` de manera consistente y segura.

#### Entradas
-   Archivo `docs/CORS-ORIGINS.md` (existente en este repositorio).
-   Endpoints de health check `/health` y `/ready` (actualmente en planificación).

#### Tareas
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

**Issue Ops creado:** https://github.com/SebastianVernisMora/Yega-API/issues/4

#### Definition of Done (DoD)
- [ ] Los tres documentos (`PM2-PLAYBOOK.md`, `GO-LIVE.md`, `OBSERVABILIDAD.md`) están creados en la carpeta `/docs` del repositorio `Yega-API`.
- [ ] El borrador del cuerpo del PR para los desarrolladores está listo y referenciado en este issue.
- [ ] El issue de handoff para el equipo de Ops está creado, enlazado y listo para ser asignado.

---

### Para pegar en: `Yega-Cliente`

**Título del Issue:** `Plan S2: Flujo de Catálogo a Pedido`

**Enlace al Issue:** https://github.com/SebastianVernisMora/Yega-Cliente/issues/2

#### Objetivo
Definir y documentar el plan de la Fase 2 (S2) para el cliente, cubriendo las rutas de la aplicación, el manejo de estados de UI/UX, la gestión de sesión de usuario y el rendimiento, todo mapeado a la especificación de OpenAPI.

#### Entradas
- OpenAPI v0.1, específicamente los `operationId`:
  - `authLogin`
  - `authRegister`
  - `catalogList`
  - `ordersCreate`
  - `ordersGetById`

#### Tareas
1.  **Crear `docs/cliente-plan.md`:**
    -   Definir las rutas de la aplicación: `/login`, `/registro`, `/tiendas`, `/tiendas/:id`, `/carrito`, `/pedido/confirmacion`.
    -   Documentar los estados de la UI: vistas vacías, `toasts` de notificación, manejo de errores `401/403` y `5xx`.
    -   Especificar el flujo de geolocalización: solicitud de permiso y fallback a entrada manual.
2.  **Crear `docs/cliente-mapeo.md`:**
    -   Crear una tabla que mapee cada Vista/Acción del cliente a su `operationId` y `path` correspondiente del API.
3.  **Crear `docs/cliente-sesion.md`:**
    -   Documentar la estrategia de manejo de sesión: uso de `access_token` y `refresh_token`.
    -   Definir la lógica de expiración, reintento de peticiones y almacenamiento seguro en el cliente.
4.  **Crear `docs/cliente-rendimiento.md`:**
    -   Establecer un presupuesto de rendimiento (bundle size).
    -   Definir la estrategia de optimización de imágenes (uso de WebP/AVIF) y `lazy-loading`.
5.  **Redactar Cuerpo de PR:**
    -   Preparar el texto para un PR que entregará estos documentos, incluyendo un checklist de DoR/DoD.

#### Definition of Done (DoD)
- [ ] Los cuatro documentos (`cliente-plan.md`, `cliente-mapeo.md`, `cliente-sesion.md`, `cliente-rendimiento.md`) están creados en la carpeta `/docs`.
- [ ] El borrador del cuerpo del PR está listo para ser usado.
- [ ] El equipo de desarrollo confirma que la documentación es suficiente para iniciar la implementación.

---

### Para pegar en: `Yega-Tienda`

**Título del Issue:** `Plan S3: Tablero de Pedidos y Transiciones de Estado`

**Enlace al Issue:** https://github.com/SebastianVernisMora/Yega-Tienda/issues/2

#### Objetivo
Documentar el plan de la Fase 3 (S3) para la aplicación de la tienda, enfocándose en el diseño del tablero de gestión de pedidos, las transiciones de estado válidas y las reglas de control de acceso basado en roles (RBAC).

#### Entradas
-   **Estados de un pedido:** `pending` → `accepted` → `preparing` → `assigned` → `on_route` → `delivered` | `canceled`.

#### Tareas
1.  **Crear `docs/tienda-plan.md`:**
    -   Diseñar las columnas del tablero Kanban correspondiendo a los estados del pedido.
    -   Definir las transiciones de estado válidas (ej. un pedido `pending` solo puede pasar a `accepted` o `canceled`).
    -   Especificar las reglas de RBAC para el rol "dueño de tienda".
    -   Documentar la funcionalidad de paginación y filtros del tablero.
2.  **Crear `docs/tienda-mapeo.md`:**
    -   Crear una tabla que mapee las acciones del tablero (ej. "Aceptar Pedido") al `operationId` de la API correspondiente, incluyendo el cambio de estado.
3.  **Redactar Cuerpo de PR:**
    -   Preparar el texto para un PR que entregará estos documentos.

#### Definition of Done (DoD)
- [ ] Los documentos `tienda-plan.md` y `tienda-mapeo.md` están creados en la carpeta `/docs`.
- [ ] El borrador del cuerpo del PR está listo para ser usado.
- [ ] El plan de RBAC cubre todas las acciones críticas del tablero.

---

### Para pegar en: `Yega-Repartidor`

**Título del Issue:** `Plan S4: Flujos de Entrega y Base PWA`

**Enlace(s) al/los Issue(s):**
- https://github.com/SebastianVernisMora/Yega-Repartidor/issues/2
- https://github.com/SebastianVernisMora/Yega-Repartidor/issues/3
- https://github.com/SebastianVernisMora/Yega-Repartidor/issues/4

#### Objetivo
Definir los flujos de trabajo para el repartidor en la Fase 4 (S4), incluyendo las guardas de secuencia para las acciones y la documentación base para la Progressive Web App (PWA).

#### Entradas
-   **Endpoints del API:** `/routes`, `/take`, `/deliver`.

#### Tareas
1.  **Crear `docs/repartidor-plan.md`:**
    -   Documentar el flujo de trabajo: ver rutas asignables, tomar una ruta, marcar pedido como en camino, y marcar como entregado.
    -   Definir las "guardas de secuencia": reglas que impiden acciones fuera de orden (ej. no se puede entregar un pedido que no ha sido tomado).
    -   Planificar el manejo de estados offline y reconexión (a nivel de UI, la lógica real se implementará en S5).
2.  **Crear `docs/pwa-base.md`:**
    -   Definir la estructura del `manifest.json` para la PWA.
    -   Documentar la estrategia de service worker, enfocada en caching de la aplicación (el offline real de datos se planificará en S5).
3.  **Redactar Cuerpo de PR:**
    -   Preparar el texto para un PR que entregará estos documentos.

#### Definition of Done (DoD)
- [ ] Los documentos `repartidor-plan.md` y `pwa-base.md` están creados en la carpeta `/docs`.
- [ ] El borrador del cuerpo del PR está listo para ser usado.
- [ ] Los flujos de trabajo cubren el ciclo de vida completo de una entrega.

---

## Checklist Final
- [x] Todos los handoffs en la tabla tienen issue creado y enlazado.
- [x] Se ha notificado a los equipos correspondientes para que creen los issues en sus respectivos repositorios.
- [x] Este documento ha sido revisado y aprobado.
