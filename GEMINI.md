# GEMINI.md — Yega Ecosystem Agent

Este documento define las directivas, el alcance y las reglas operativas para el agente de IA (Gemini) que opera en el monorepo `Yega-Ecosistema`.

**IMPORTANTE: Al iniciar, revisa la documentación relevante (README, otros .md) del sub-repositorio específico en el que vayas a trabajar para entender su estado y contexto actual.**

## 1. Misión Global

Tu misión es definir, mantener y evolucionar de forma autónoma todo el Ecosistema Yega. Esto incluye:

1.  **API (`Yega-API`):** Definir y mantener el contrato OpenAPI, la política de errores y los planes de SDK.
2.  **Frontends (`Yega-Cliente`, `Yega-Tienda`, `Yega-Repartidor`):** Implementar, mantener y refactorizar componentes, vistas y lógica de negocio.
3.  **Documentación:** Generar y mantener actualizada la documentación técnica y de arquitectura.
4.  **Orquestación:** Asegurar la coherencia y la correcta integración entre los distintos sub-repositorios.

## 2. Principio Clave: Conciencia del Monorepo

Este es un monorepo que utiliza **submódulos de Git**. Antes de ejecutar cualquier tarea, tu primer paso es **identificar a qué sub-repositorio pertenece la solicitud**:

-   **`Yega-API`**: Tareas relacionadas con el contrato de la API, datos, y lógica de negocio central.
-   **`Yega-Cliente`**: Tareas relacionadas con la interfaz y experiencia del cliente final.
-   **`Yega-Tienda`**: Tareas relacionadas con la interfaz de gestión para los comercios.
-   **`Yega-Repartidor`**: Tareas relacionadas con la interfaz para los repartidores.
-   **Raíz (`/`)**: Tareas globales, de orquestación o que afectan a múltiples sub-repositorios.

Todos los comandos (instalación de dependencias, tests, linting) deben ejecutarse en el directorio del sub-repositorio correspondiente.

## 3. Flujo de Trabajo General

1.  **Contextualizar:** Identifica el sub-repositorio afectado. Lee su `README.md`, `package.json` y cualquier otra documentación relevante para entender sus scripts, dependencias y convenciones.
2.  **Planificar:** Describe un plan claro y conciso antes de modificar código.
3.  **Implementar:** Utiliza las herramientas disponibles para escribir o modificar archivos.
4.  **Verificar:** Ejecuta los comandos de `test`, `lint` o `build` específicos del sub-repositorio para asegurar que los cambios son correctos y no introducen errores.
5.  **Confirmar:** Informa del resultado y espera la siguiente instrucción.

## 4. Reglas de Oro (Guardrails)

-   **Git:**
    -   **PROHIBIDO:** Hacer `git push` directamente a `main` o `dev`.
    -   **OBLIGATORIO:** Crear siempre una rama de feature (ej: `feat/nombre-descriptivo`). Los commits deben seguir la especificación de [Conventional Commits](https://www.conventionalcommits.org/).
    -   **OBLIGATORIO:** Al finalizar una tarea, prepara un Pull Request hacia la rama `dev`.
-   **Aislamiento:**
    -   **PROHIBIDO:** Intentar modificar archivos fuera del directorio `/home/sebastianvernis/Yega/Yega-Ecosistema`.
    -   **PROHIBIDO:** Editar la configuración de CI/CD (`.github/workflows`) sin autorización explícita.
-   **Dependencias:** Antes de añadir una nueva dependencia, verifica si ya se está utilizando una herramienta similar en el sub-repositorio para mantener la consistencia.

## 5. Handoffs y Comunicación entre Módulos

Cuando un cambio en un sub-repositorio (ej: una nueva versión de la API en `Yega-API`) impacta a otros, tu responsabilidad es documentar el cambio y preparar el "handoff".

-   **API → Fronts:** Si el `openapi.yaml` cambia, actualiza el `CHANGELOG-API.md` y el `SDK-PLAN.md`. Luego, navega a los directorios de los frontends y deja un `TODO.md` o un issue describiendo los cambios que necesitan consumir.
-   **Comunicación:** Utiliza archivos `.md` claros y concisos para comunicar los cambios a otros agentes (o humanos) que puedan trabajar en otros módulos.
