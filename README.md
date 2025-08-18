# Yega Ecosistema

## Descripción General

Este repositorio, `Yega-Ecosistema`, es el monorepo que orquesta la documentación, planificación y artefactos de desarrollo para la plataforma Yega. La plataforma se compone de una API central y tres aplicaciones de frontend distintas, cada una orientada a un rol de usuario específico: clientes, repartidores y tiendas.

## Estado del Proyecto: Implementación por Fases

El proyecto ha completado con éxito el **Sprint 0**, que consistió en la planificación fundacional y la definición de la arquitectura inicial. Actualmente, nos encontramos en la fase de **implementación por fases (S1-S4)**, donde cada componente del ecosistema tiene un plan de trabajo definido y documentado.

El estado actual de cada componente es el siguiente:

| Componente      | Fase Actual | Objetivo Principal                                  | Plan Detallado (Handoff)                                                                               |
| :-------------- | :---------- | :-------------------------------------------------- | :----------------------------------------------------------------------------------------------------- |
| **Yega-API**    | `S1`        | Consolidar configuración de CORS y docs de despliegue | [Plan S1: Yega-API](https://github.com/SebastianVernisMora/Yega-API/issues/2)        |
| **Yega-Cliente**  | `S2`        | Definir el flujo de catálogo a pedido               | [Plan S2: Yega-Cliente](https://github.com/SebastianVernisMora/Yega-Cliente/issues/2)    |
| **Yega-Tienda**   | `S3`        | Diseñar el tablero de gestión de pedidos            | [Plan S3: Yega-Tienda](https://github.com/SebastianVernisMora/Yega-Tienda/issues/2)      |
| **Yega-Repartidor**| `S4`        | Documentar los flujos de entrega y la base PWA      | [Plan S4: Yega-Repartidor](https://github.com/SebastianVernisMora/Yega-Repartidor/issues/2) |

Para un seguimiento detallado del progreso, consulta el [índice de handoffs](./docs/handoffs/index.md).

## Estructura del Ecosistema

El ecosistema está compuesto por varios sub-repositorios (submódulos de Git) que contienen el código fuente de cada aplicación. La estructura completa del monorepo y el propósito de cada componente están detallados en el documento **[Mapeo del Ecosistema](./ECOSISTEMA.md)**.

| Componente | Repositorio | Descripción |
| :--- | :--- | :--- |
| **API** | [Yega-API](./Yega-API/) | La API central que da servicio a todas las aplicaciones cliente. |
| **Cliente App** | [Yega-Cliente](./Yega-Cliente/) | La aplicación web para los clientes finales que realizan pedidos. |
| **Tienda App** | [Yega-Tienda](./Yega-Tienda/) | La aplicación web para que las tiendas gestionen su inventario y pedidos. |
| **Repartidor App** | [Yega-Repartidor](./Yega-Repartidor/) | La aplicación web para que los repartidores gestionen las entregas. |

## Flujo de Trabajo y Contribuciones

El desarrollo en `Yega-Ecosistema` sigue un flujo de trabajo orquestado por agentes de IA para garantizar la calidad y coherencia. Antes de contribuir, es fundamental revisar la **[guía de orquestación de agentes](./docs/agents/AGENTS.md)**.

Puntos clave:
- **Repositorio de Orquestación**: Este repositorio se usa para gestionar la documentación y la planificación. **No se escribe código de aplicación directamente aquí.**
- **Handoffs Cross-Repo**: Los cambios que deben implementarse en los sub-repositorios se documentan primero aquí y se transfieren como un `issue` de "handoff".
- **Flujo de PRs**: Todo el trabajo se realiza en ramas y se integra a `dev` a través de Pull Requests. `main` es una rama protegida.

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
