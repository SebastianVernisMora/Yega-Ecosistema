# Estado de Submódulos

Este documento resume la rama activa y el último commit de cada submódulo, más pautas para sincronizar referencias desde el superproyecto.

## Resumen actual

- Yega-API
  - Rama: dev
  - Último: 561c3e3 (2025-08-19) Merge pull request #25 from SebastianVernisMora/feat/implementacion-sprint-1
- Yega-Cliente
  - Rama: feat/sprint-1-completion
  - Último: 81871f5 (2025-08-19) feat(cliente): Implementar funcionalidades completas del Sprint 1
- Yega-Repartidor
  - Rama: feat/full-delivery-flow-integration
  - Último: 92763d0 (2025-08-19) docs(sprint-1): update board and issues
- Yega-Tienda
  - Rama: feat/sprint-1-dashboard-kanban
  - Último: 5cf2bbd (2025-08-19) feat(kanban): Implementa dashboard, detalle y drag and drop

## Convenciones

- Cada submódulo avanza en `dev` o `feat/*` y expone documentación del sprint en su `docs/`.
- El superproyecto fija un commit específico por sprint. No usar refs flotantes en producción.

## Comandos útiles

- Inicializar y actualizar submódulos:
  ```bash
  git submodule update --init --recursive
  ```
- Traer el último `origin/dev` de cada submódulo y fusionar en el checkout actual:
  ```bash
  git submodule update --remote --merge
  ```
- Cambiar de rama dentro de un submódulo y fijar la referencia en el superproyecto:
  ```bash
  cd Yega-API && git checkout dev && git pull && cd -
  git add Yega-API
  git commit -m "chore(submodules): fijar Yega-API en dev@<sha>"
  ```

## Enlaces rápidos

- API: ./../../Yega-API/
- Cliente: ./../../Yega-Cliente/
- Repartidor: ./../../Yega-Repartidor/
- Tienda: ./../../Yega-Tienda/
