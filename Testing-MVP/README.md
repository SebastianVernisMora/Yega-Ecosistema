# Testing-MVP — Guía de Arranque y Pruebas

Este folder agrupa clones limpios preparados para validar el MVP de geolocalización y ciclos básicos hoy.

## Contenido
- `Yega-API-MVP` — API Express (TypeScript) con endpoints `/api/v1/deliveries` para: asignables, take, location (POST/GET) y acciones.
- `Yega-Cliente-MVP` — Frontend React (tracking con badge “Live” si hay ubicación en API).
- `Yega-Tienda-MVP` — Frontend React (build y navegación principal).
- `Yega-Repartidor-MVP` — Frontend React (geolocalización real + fallback HTTP para enviar ubicación).

## Requisitos
- Node.js 18+ y pnpm (recomendado) o npm.
- Puertos libres: API `3001`, Vite: `5173` (Cliente) y `5175` (Repartidor). Vite cambia de puerto si el predeterminado está ocupado.

## Variables de Entorno
- `Yega-Cliente-MVP/.env`: `VITE_API_BASE_URL=http://localhost:3001`
- `Yega-Repartidor-MVP/.env`: `VITE_API_BASE_URL=http://localhost:3001`
- `Yega-Tienda-MVP/.env`: `VITE_API_BASE_URL=http://localhost:3001`

## Arranque Rápido
1) API
   - `cd Testing-MVP/Yega-API-MVP && pnpm install && pnpm dev`
   - Salud: `curl http://localhost:3001/health`
2) Repartidor
   - `cd Testing-MVP/Yega-Repartidor-MVP && pnpm install && pnpm dev -- --port 5175`
   - Abre `http://127.0.0.1:5175`
3) Cliente
   - `cd Testing-MVP/Yega-Cliente-MVP && pnpm install && pnpm dev -- --port 5173`
   - Abre `http://127.0.0.1:5173`

## Flujo de Demo
1) Repartidor (Dashboard): obtiene pedidos de `GET /api/v1/deliveries/assignable`.
2) Aceptar pedido: `POST /api/v1/deliveries/:id/take` → vista “Entrega Activa”.
3) Envío de ubicación: si no hay WebSocket, `realtimeService` hace `POST /deliveries/:id/location` (fallback HTTP).
4) Cliente (Tracking): hace polling a `GET /deliveries/:id/location`; muestra badge “Live” al detectar ubicación.
5) Avanzar estados: `POST /deliveries/:id/:action` (`arrive|pickup|deliver`).

## Smoke Tests Manuales
- Asignables: `curl http://localhost:3001/api/v1/deliveries/assignable`
- Take: `curl -X POST http://localhost:3001/api/v1/deliveries/ORD-1001/take -H 'Content-Type: application/json' -d '{"timestamp":"2025-01-01T00:00:00Z"}'`
- Ubicación:
  - `curl -X POST http://localhost:3001/api/v1/deliveries/ORD-1001/location -H 'Content-Type: application/json' -d '{"latitude":4.7110,"longitude":-74.0721,"accuracy":10,"speed":0,"timestamp":1690000000000}'`
  - `curl http://localhost:3001/api/v1/deliveries/ORD-1001/location`

## Consejos
- Si un puerto está ocupado, Vite moverá el servidor automáticamente y mostrará la URL en consola.
- La ubicación se almacena en memoria (reiniciar API borra posiciones).
- Para pruebas E2E posteriores: persistir en BD y habilitar WebSocket en la API.
