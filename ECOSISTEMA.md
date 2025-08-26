# Mapeo del Ecosistema Yega

Este documento describe la estructura de directorios y archivos del monorepo `Yega-Ecosistema`, detallando el propósito de cada sub-repositorio y sus componentes clave.

## 1. Repositorio Raíz (`Yega-Ecosistema`)

Contiene la configuración global, la orquestación y la documentación de todo el ecosistema. Actúa como el contenedor principal de los submódulos de Git.

```
/
├───.gitmodules             # Define los sub-repositorios (submódulos)
├───package.json            # Dependencias y scripts globales
├───yega_orchestrator.sh    # Posible script para gestionar el ecosistema
├───docs/                   # Documentación global del proyecto
│   ├───agents-global.md
│   └───...
├───Yega-API/               # Submódulo para la API Backend
├───Yega-Cliente/           # Submódulo para la App del Cliente
├───Yega-Repartidor/        # Submódulo para la App del Repartidor
└───Yega-Tienda/            # Submódulo para la App de la Tienda
```

---

## 2. Yega-API

El backend principal del ecosistema. Su responsabilidad es definir y servir el contrato de la API (OpenAPI) que consumirán las aplicaciones frontend.

- **Tecnología principal:** No definida en la estructura, pero gestiona el contrato de la API.
- **Rol:** Define los endpoints, modelos de datos, y políticas de errores.

```
Yega-API/
├───GEMINI.md               # Instrucciones para el agente de IA en este repo
├───contracts/
│   └───openapi.yaml        # CONTRATO DE API. La fuente de verdad para la comunicación.
└───docs/
    ├───CHANGELOG-API.md    # Historial de cambios de la API
    ├───ERRORS.md           # Definición de la política y estructura de errores
    ├───SDK-PLAN.md         # Estrategia para generar y distribuir SDKs a los fronts
    └───...
```

---

## 3. Yega-Cliente

La aplicación web (PWA) para el cliente final. Permite a los usuarios navegar por el catálogo, realizar pedidos, ver su historial y gestionar su cuenta.

- **Tecnología principal:** Vite, React, TypeScript.
- **Rol:** Interfaz de usuario para el consumidor.

```
Yega-Cliente/
├───vite.config.ts          # Configuración del empaquetador y servidor de desarrollo
├───package.json            # Dependencias y scripts del proyecto
├───public/                 # Archivos estáticos (imágenes, iconos)
└───src/
    ├───main.tsx            # Punto de entrada de la aplicación React
    ├───App.tsx             # Componente raíz
    ├───components/         # Componentes de UI reutilizables (Ej: MobileLayout, LoginScreen)
    ├───hooks/              # Hooks de React personalizados
    ├───lib/                # Utilidades y lógica de negocio
    └───pages/              # Vistas principales de la aplicación
```

---

## 4. Yega-Repartidor

La aplicación web (PWA) para los repartidores. Les permite ver los pedidos asignados, gestionar sus rutas y actualizar el estado de las entregas.

- **Tecnología principal:** Vite, React, TypeScript.
- **Rol:** Herramienta de trabajo para el personal de reparto.

```
Yega-Repartidor/
├───vite.config.ts
├───package.json
├───public/
└───src/
    ├───main.tsx
    ├───App.tsx
    ├───components/
    ├───hooks/
    ├───lib/
    └───pages/
```

---

## 5. Yega-Tienda

La aplicación web (PWA) para los comercios o tiendas asociadas. Permite gestionar el catálogo de productos, recibir y procesar pedidos, y ver analíticas de ventas.

- **Tecnología principal:** Vite, React, TypeScript.
- **Rol:** Herramienta de gestión para los vendedores.

```
Yega-Tienda/
├───vite.config.ts
├───package.json
├───public/
└───src/
    ├───main.tsx
    ├───App.tsx
    ├───components/
    ├───hooks/
    ├───lib/
    └───pages/
```

---

## Automatización de Sprint (Projects v2)

Este ecosistema usa GitHub Projects v2 a nivel de usuario para gestionar los tableros de sprint de cada repo. La automatización mueve el campo `Status` de los issues cuando se abren/mergean PRs o se cierran/reabren issues.

- Guía: [docs/PROJECTS-AUTOMATION.md](./docs/PROJECTS-AUTOMATION.md)
- Tableros (usuario): “Sprint 2 - Yega-API”, “Sprint 2 - Yega-Cliente”, “Sprint 2 - Yega-Tienda”, “Sprint 2 - Yega-Repartidor”.
- Backlog por repo: `docs/ISSUES-Sprint-2.md` en cada repositorio.
- Etiqueta del sprint: `sprint-2`.

Para listar projects por CLI:

```bash
gh project list --owner SebastianVernisMora
```
