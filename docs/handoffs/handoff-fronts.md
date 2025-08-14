# Handoffs para Repositorios Frontend

Este documento contiene los borradores de issues para ser creados en los repositorios de `Yega-Cliente`, `Yega-Tienda` y `Yega-Repartidor`.

---

## Para pegar en: `Yega-Cliente`

**Título del Issue:** `Plan S2: Flujo de Catálogo a Pedido`

### Objetivo
Definir y documentar el plan de la Fase 2 (S2) para el cliente, cubriendo las rutas de la aplicación, el manejo de estados de UI/UX, la gestión de sesión de usuario y el rendimiento, todo mapeado a la especificación de OpenAPI.

### Entradas
- OpenAPI v0.1, específicamente los `operationId`:
  - `authLogin`
  - `authRegister`
  - `catalogList`
  - `ordersCreate`
  - `ordersGetById`

### Tareas
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

### Definition of Done (DoD)
- [ ] Los cuatro documentos (`cliente-plan.md`, `cliente-mapeo.md`, `cliente-sesion.md`, `cliente-rendimiento.md`) están creados en la carpeta `/docs`.
- [ ] El borrador del cuerpo del PR está listo para ser usado.
- [ ] El equipo de desarrollo confirma que la documentación es suficiente para iniciar la implementación.

---

## Para pegar en: `Yega-Tienda`

**Título del Issue:** `Plan S3: Tablero de Pedidos y Transiciones de Estado`

### Objetivo
Documentar el plan de la Fase 3 (S3) para la aplicación de la tienda, enfocándose en el diseño del tablero de gestión de pedidos, las transiciones de estado válidas y las reglas de control de acceso basado en roles (RBAC).

### Entradas
-   **Estados de un pedido:** `pending` → `accepted` → `preparing` → `assigned` → `on_route` → `delivered` | `canceled`.

### Tareas
1.  **Crear `docs/tienda-plan.md`:**
    -   Diseñar las columnas del tablero Kanban correspondiendo a los estados del pedido.
    -   Definir las transiciones de estado válidas (ej. un pedido `pending` solo puede pasar a `accepted` o `canceled`).
    -   Especificar las reglas de RBAC para el rol "dueño de tienda".
    -   Documentar la funcionalidad de paginación y filtros del tablero.
2.  **Crear `docs/tienda-mapeo.md`:**
    -   Crear una tabla que mapee las acciones del tablero (ej. "Aceptar Pedido") al `operationId` de la API correspondiente, incluyendo el cambio de estado.
3.  **Redactar Cuerpo de PR:**
    -   Preparar el texto para un PR que entregará estos documentos.

### Definition of Done (DoD)
- [ ] Los documentos `tienda-plan.md` y `tienda-mapeo.md` están creados en la carpeta `/docs`.
- [ ] El borrador del cuerpo del PR está listo para ser usado.
- [ ] El plan de RBAC cubre todas las acciones críticas del tablero.

---

## Para pegar en: `Yega-Repartidor`

**Título del Issue:** `Plan S4: Flujos de Entrega y Base PWA`

### Objetivo
Definir los flujos de trabajo para el repartidor en la Fase 4 (S4), incluyendo las guardas de secuencia para las acciones y la documentación base para la Progressive Web App (PWA).

### Entradas
-   **Endpoints del API:** `/routes`, `/take`, `/deliver`.

### Tareas
1.  **Crear `docs/repartidor-plan.md`:**
    -   Documentar el flujo de trabajo: ver rutas asignables, tomar una ruta, marcar pedido como en camino, y marcar como entregado.
    -   Definir las "guardas de secuencia": reglas que impiden acciones fuera de orden (ej. no se puede entregar un pedido que no ha sido tomado).
    -   Planificar el manejo de estados offline y reconexión (a nivel de UI, la lógica real se implementará en S5).
2.  **Crear `docs/pwa-base.md`:**
    -   Definir la estructura del `manifest.json` para la PWA.
    -   Documentar la estrategia de service worker, enfocada en caching de la aplicación (el offline real de datos se planificará en S5).
3.  **Redactar Cuerpo de PR:**
    -   Preparar el texto para un PR que entregará estos documentos.

### Definition of Done (DoD)
- [ ] Los documentos `repartidor-plan.md` y `pwa-base.md` están creados en la carpeta `/docs`.
- [ ] El borrador del cuerpo del PR está listo para ser usado.
- [ ] Los flujos de trabajo cubren el ciclo de vida completo de una entrega.
