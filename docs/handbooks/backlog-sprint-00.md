# Backlog Sprint 0: Arranque del Ecosistema Yega

## Definition of Ready (DoR)
- [x] Plan diario (`diario-2025-08-14.md`) definido y aprobado.
- [x] Handoffs de alto nivel identificados para cada repositorio.

## Objetivos del Sprint
- Establecer la documentación fundacional de DevOps, Arquitectura y Plan de Producto para cada componente del ecosistema.
- Preparar a los equipos de desarrollo para que puedan comenzar la implementación de las fases S1 a S4.

## Riesgos
- **Riesgo 1:** La carga de trabajo puede ser subestimada.
  - **Mitigación:** Las tareas son de documentación y planificación, no de implementación, lo que reduce la variabilidad. Se prioriza para enfocar el esfuerzo.
- **Riesgo 2:** Dependencias cruzadas no identificadas.
  - **Mitigación:** La planificación centralizada en `Yega-Ecosistema` busca exponer estas dependencias.

## Backlog Priorizado por Repositorio

### Yega-API
| ID      | Tarea                                    | Fase | Prioridad |
|---------|------------------------------------------|------|-----------|
| API-S1-1| Documentar y configurar CORS y Orígenes  | S1   | P0 - Bloqueante |
| API-S1-2| Crear Playbook de PM2 para despliegue    | S1   | P0 - Bloqueante |
| API-S1-3| Definir plan de Go-Live y Observabilidad | S1   | P1 - Alto     |

### Yega-Cliente
| ID        | Tarea                                          | Fase | Prioridad |
|-----------|------------------------------------------------|------|-----------|
| CLI-S2-1  | Definir Plan de Rutas, Estados y UX            | S2   | P0 - Bloqueante |
| CLI-S2-2  | Mapear Vistas/Acciones a OpenAPI               | S2   | P0 - Bloqueante |
| CLI-S2-3  | Documentar manejo de Sesión (Access/Refresh)   | S2   | P1 - Alto     |
| CLI-S2-4  | Establecer presupuesto de Rendimiento y assets | S2   | P2 - Medio    |

### Yega-Tienda
| ID        | Tarea                                          | Fase | Prioridad |
|-----------|------------------------------------------------|------|-----------|
| TDA-S3-1  | Documentar Plan del Tablero y Transiciones     | S3   | P0 - Bloqueante |
| TDA-S3-2  | Mapear Acciones del Tablero a OpenAPI          | S3   | P1 - Alto     |

### Yega-Repartidor
| ID        | Tarea                                          | Fase | Prioridad |
|-----------|------------------------------------------------|------|-----------|
| REP-S4-1  | Definir Plan de Flujos y Guardas de Secuencia  | S4   | P0 - Bloqueante |
| REP-S4-2  | Documentar Base de PWA (Manifiesto y Offline)  | S4   | P1 - Alto     |

## Definition of Done (DoD)
- [ ] Todos los handoffs correspondientes a las tareas P0 han sido creados y entregados.
- [ ] Los equipos de cada repositorio han confirmado la recepción y entendimiento de las tareas.

## Checklist de Ejecución
- [ ] Crear handoff para `Yega-API`.
- [ ] Crear handoff para `Yega-Cliente`.
- [ ] Crear handoff para `Yega-Tienda`.
- [ ] Crear handoff para `Yega-Repartidor`.
- [ ] Actualizar `docs/handoffs/index.md`.
