# Checklist de Pendientes - Fase Actual (Sprint 1)

## Objetivo General
Completar la implementacion de las funcionalidades definidas para el Sprint 1 en todos los modulos del ecosistema Yega.

## Yega-API

### Documentacion
- [x] PM2-PLAYBOOK.md (creado)
- [x] GO-LIVE.md (creado)
- [x] OBSERVABILIDAD.md (creado)
- [x] CORS-ORIGINS.md (existente)
- [ ] Borrador de PR para documentacion
- [x] Issue de handoff para Ops (Issue #4)

### Implementacion
- [ ] Refinar contrato OpenAPI (`openapi.yaml`)
- [ ] Expandir servidor mock
- [ ] Endpoint: Crear Pedido (`POST /pedidos`)
- [ ] Endpoint: Cambiar Estado de Pedido (`PATCH /pedidos/:id`)

## Yega-Cliente

### Documentacion
- [x] cliente-plan.md (creado)
- [x] cliente-mapeo.md (creado)
- [x] cliente-sesion.md (creado)
- [x] cliente-rendimiento.md (creado)
- [ ] Borrador de PR para documentacion

### Implementacion
- [ ] Implementar Login (`LoginScreen`)
- [ ] Implementar Registro (`RegisterScreen`)
- [ ] Dashboard con Tiendas (`DashboardScreen`)
- [ ] Detalle de Tienda (`StoreDetailScreen`)
- [ ] Carrito y Checkout (`CartScreen`)
- [ ] Confirmacion de Pedido (`OrderSuccessScreen`)

## Yega-Tienda

### Documentacion
- [x] tienda-plan.md (creado)
- [x] tienda-mapeo.md (creado)
- [ ] Borrador de PR para documentacion

### Implementacion
- [ ] Dashboard de Pedidos (`DashboardTienda`)
- [ ] Drag & Drop en Tablero Kanban
- [ ] Detalle de Pedido (`PedidoDetalle`)

## Yega-Repartidor

### Documentacion
- [x] repartidor-plan.md (creado)
- [x] pwa-base.md (creado)
- [ ] Borrador de PR para documentacion

### Implementacion
- [ ] Dashboard de Pedidos Disponibles (`PedidosDashboard`)
- [ ] Flujo de Entrega (`RutaEntregaScreen`)
- [ ] Configurar PWA basica (`manifest.json`, `service-worker.js`)

## Estado General

| Modulo          | Documentacion Completada | Implementacion Iniciada | Implementacion Completada |
|----------------|--------------------------|--------------------------|----------------------------|
| Yega-API       | [x] 4/4                   | [ ] 0/4                   | [ ] 0/4                     |
| Yega-Cliente   | [x] 4/4                   | [ ] 0/6                   | [ ] 0/6                     |
| Yega-Tienda    | [x] 2/2                   | [ ] 0/3                   | [ ] 0/3                     |
| Yega-Repartidor| [x] 2/2                   | [ ] 0/3                   | [ ] 0/3                     |

## Proximos Pasos

1. Iniciar implementacion de funcionalidades en todos los modulos
2. Crear PRs de documentacion en cada repositorio
3. Coordinar el trabajo entre equipos para mantener sincronizacion
4. Actualizar tableros de seguimiento (BOARD-Sprint-1.md) a medida que se avanza
5. Preparar para la revision del Sprint 1 al finalizar las implementaciones