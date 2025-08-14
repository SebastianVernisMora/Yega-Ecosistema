# Yega Ecosistema

## Descripción General

Este repositorio, `Yega-Ecosistema`, es el monorepo que orquesta el desarrollo de la plataforma Yega. La plataforma se compone de una API central y tres aplicaciones de frontend distintas, cada una orientada a un rol de usuario específico: clientes, repartidores y tiendas.

## Arquitectura

El siguiente diagrama ilustra la interacción entre los diferentes componentes del ecosistema:

```mermaid
flowchart LR
  subgraph Repo_API
    A[Gemini CLI\nAPI-Contract] -- openapi.yaml/ERRORS.md --> PR_API[PR a dev]
  end

  subgraph Repo_Cliente
    C[Copilot\nFront Cliente] <-- handoff: openapi.yaml --> Issue_C[Issue: Consumir contrato]
  end

  subgraph Repo_Tienda
    T[Copilot\nFront Tienda] <-- handoff: openapi.yaml --> Issue_T[Issue: Consumir contrato]
  end

  subgraph Repo_Repartidor
    R[Copilot\nFront Repartidor] <-- handoff: openapi.yaml --> Issue_R[Issue: Consumir contrato]
  end

  subgraph Orquestacion
    J[Jules (Labs)] -- coordina docs\n(Repo actual) --> PR_DOCS[PR docs a dev]
  end

  PR_API --> HandoffAPI[Handoff Notes]
  HandoffAPI --> Issue_C
  HandoffAPI --> Issue_T
  HandoffAPI --> Issue_R
```

## Componentes

El ecosistema está compuesto por los siguientes sub-repositorios (submódulos de Git):

| Componente | Repositorio | Descripción |
| :--- | :--- | :--- |
| **API** | [Yega-API](./Yega-API/) | La API central que da servicio a todas las aplicaciones cliente. |
| **Cliente App** | [Yega-Cliente](./Yega-Cliente/) | La aplicación web para los clientes finales que realizan pedidos. |
| **Tienda App** | [Yega-Tienda](./Yega-Tienda/) | La aplicación web para que las tiendas gestionen su inventario y pedidos. |
| **Repartidor App** | [Yega-Repartidor](./Yega-Repartidor/) | La aplicación web para que los repartidores gestionen las entregas. |

## Cómo Empezar

Para trabajar con este repositorio, primero necesitas clonarlo y luego inicializar y actualizar los submódulos de Git.

```sh
# 1. Clona el repositorio principal
git clone <URL_DEL_REPO_YEGA_ECOSISTEMA>
cd Yega-Ecosistema

# 2. Inicializa y actualiza los submódulos
git submodule init
git submodule update
```

## Detalles de los Componentes

### Yega-API

- **Propósito**: API central de la plataforma.
- **Documentación**: La especificación completa de la API se encuentra en el archivo [openapi.yaml](./Yega-API/contracts/openapi.yaml).

### Aplicaciones Frontend

Todas las aplicaciones de frontend comparten una pila de tecnología similar y siguen los mismos pasos básicos para la configuración y ejecución local.

- **Tecnologías Comunes**:
  - Vite
  - React
  - TypeScript
  - shadcn/ui
  - Tailwind CSS

- **Pasos para Ejecutar (ejemplo con `Yega-Cliente`)**:

  ```sh
  # 1. Navega al directorio del componente
  cd Yega-Cliente

  # 2. Instala las dependencias
  npm install

  # 3. Inicia el servidor de desarrollo
  npm run dev
  ```

  Repite estos pasos para `Yega-Tienda` y `Yega-Repartidor` según sea necesario. Para más detalles sobre cada aplicación, consulta el `README.md` dentro de su respectivo directorio.