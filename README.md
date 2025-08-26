# Yega Ecosistema

## Descripción General

Este repositorio, `Yega-Ecosistema`, es el monorepo que orquesta la documentación, planificación y artefactos de desarrollo para la plataforma Yega. La plataforma se compone de una API central y tres aplicaciones de frontend distintas, cada una orientada a un rol de usuario específico: clientes, repartidores y tiendas.

## Estado del Proyecto: Sprint 2 - Integración y Funcionalidades Avanzadas

El proyecto ha concluido la fase de planificación y setup inicial (Sprint 1) y ahora se encuentra en el **Sprint 2**. El objetivo de este sprint es conectar los componentes del ecosistema, reemplazar los mocks por la API real, e implementar funcionalidades críticas como pagos, notificaciones y geolocalización.

El estado actual de cada componente es el siguiente:

| Componente      | Objetivo Principal del Sprint 2                                       | Plan Detallado                                      |
| :-------------- | :-------------------------------------------------------------------- | :-------------------------------------------------- |
| **Yega-API**    | Implementar endpoints reales, autenticación, y sistemas de pago y notificaciones. | [Plan de Trabajo - Sprint 2](./PLAN_TRABAJO_SPRINT_2.md) |
| **Yega-Cliente**  | Integrar con la API real, implementar flujo de pagos y notificaciones.       | [Plan de Trabajo - Sprint 2](./PLAN_TRABAJO_SPRINT_2.md) |
| **Yega-Tienda**   | Conectar a la API, implementar gestión de inventario y analytics.   | [Plan de Trabajo - Sprint 2](./PLAN_TRABAJO_SPRINT_2.md) |
| **Yega-Repartidor**| Integrar con la API, implementar geolocalización avanzada y PWA offline. | [Plan de Trabajo - Sprint 2](./PLAN_TRABAJO_SPRINT_2.md) |

Para un seguimiento detallado del progreso, consulta el [checklist de la fase actual](./docs/plan/checklist-fase-actual.md).

## Estructura del Ecosistema

El ecosistema está compuesto por varios sub-repositorios (submódulos de Git) que contienen el código fuente de cada aplicación. La estructura completa del monorepo y el propósito de cada componente están detallados en el documento **[Mapeo del Ecosistema](./ECOSISTEMA.md)**.

| Componente | Repositorio | Descripción |
| :--- | :--- | :--- |
| **API** | [Yega-API](./Yega-API/) | La API central que da servicio a todas las aplicaciones cliente. |
| **Cliente App** | [Yega-Cliente](./Yega-Cliente/) | La aplicación web para los clientes finales que realizan pedidos. |
| **Tienda App** | [Yega-Tienda](./Yega-Tienda/) | La aplicación web para que las tiendas gestionen su inventario y pedidos. |
| **Repartidor App** | [Yega-Repartidor](./Yega-Repartidor/) | La aplicación web para que los repartidores gestionen las entregas. |

### Submódulos y ramas activas

Consulta el estado actual (rama y último commit) de cada submódulo en `docs/submodules/STATUS.md`. Ahí también se detallan convenciones para sincronizar ramas y actualizar referencias del superproyecto.

## Flujo de Trabajo y Contribuciones

El desarrollo en `Yega-Ecosistema` sigue un flujo de trabajo orquestado por agentes de IA para garantizar la calidad y coherencia. Antes de contribuir, es fundamental revisar la **[guía de orquestación de agentes](./docs/agents/AGENTS.md)**.

Puntos clave:
- **Repositorio de Orquestación**: Este repositorio se usa para gestionar la documentación y la planificación. **No se escribe código de aplicación directamente aquí.**
- **Handoffs Cross-Repo**: Los cambios que deben implementarse en los sub-repositorios se documentan primero aquí y se transfieren como un `issue` de "handoff".
- **Flujo de PRs**: Todo el trabajo se realiza en ramas y se integra a `dev` a través de Pull Requests. `main` es una rama protegida.

### Convenciones de ramas y submódulos

- `main`: línea base estable del monorepo.
- `dev`: rama de integración activa para documentación/planeación.
- Submódulos deben trabajar en `dev` o `feat/*` propios y el superproyecto fija el commit requerido por sprint.
- Para actualizar referencias: `git submodule update --remote --merge` o fijar manualmente la revisión y commitear en el superproyecto.

## Cómo Empezar

Para configurar el entorno de desarrollo, clona este repositorio junto con sus submódulos.

```sh
# 1. Clona el repositorio principal con todos sus submódulos
git clone --recurse-submodules <URL_DEL_REPO_YEGA_ECOSISTEMA>
cd Yega-Ecosistema

# 2. Si ya lo clonaste sin submódulos, inicialízalos manually
git submodule update --init --recursive
```

Una vez clonado, consulta el `README.md` de cada sub-repositorio para instrucciones específicas de ejecución.

## Licencia

Este proyecto se distribuye bajo la licencia [MIT](./LICENSE).
