#!/usr/bin/env bash
set -euo pipefail

# bootstrap_mvp.sh — Arranca/Detiene los servicios del MVP en Testing-MVP
# Uso:
#   ./bootstrap_mvp.sh start   # instala deps si hace falta y levanta API, Repartidor, Cliente, Tienda
#   ./bootstrap_mvp.sh stop    # detiene todos los servicios
#   ./bootstrap_mvp.sh status  # muestra estado de procesos y URLs

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_DIR="$BASE_DIR/logs"
mkdir -p "$LOG_DIR"

PM="pnpm"
if ! command -v pnpm >/dev/null 2>&1; then PM="npm"; fi

start_service() {
  local name="$1"; shift
  local dir="$1"; shift
  local cmd="$*"
  local out="$LOG_DIR/${name}.out"
  local pidf="$LOG_DIR/${name}.pid"

  echo "==> [$name] installing deps"
  (cd "$dir" && $PM install)

  echo "==> [$name] starting"
  nohup bash -lc "cd '$dir' && ($cmd)" >"$out" 2>&1 & echo $! >"$pidf"
}

stop_service() {
  local name="$1"; local pidf="$LOG_DIR/${name}.pid"
  if [ -f "$pidf" ]; then
    local pid
    pid=$(cat "$pidf" || true)
    if [ -n "${pid:-}" ] && kill -0 "$pid" 2>/dev/null; then
      echo "==> Stopping $name ($pid)"
      kill "$pid" 2>/dev/null || true
      sleep 1
      kill -9 "$pid" 2>/dev/null || true
    fi
    rm -f "$pidf"
  fi
}

status_service() {
  local name="$1"; local pidf="$LOG_DIR/${name}.pid"
  if [ -f "$pidf" ]; then
    local pid; pid=$(cat "$pidf" || true)
    if [ -n "${pid:-}" ] && kill -0 "$pid" 2>/dev/null; then
      echo "- $name: RUNNING (pid $pid)"
    else
      echo "- $name: STOPPED"
    fi
  else
    echo "- $name: STOPPED"
  fi
}

case "${1:-start}" in
  start)
    # API (3001)
    start_service "api" "$BASE_DIR/Yega-API-MVP" "$PM dev || $PM run dev"
    sleep 5 || true
    # Repartidor (5175)
    start_service "repartidor" "$BASE_DIR/Yega-Repartidor-MVP" "$PM dev -- --port 5175 || $PM run dev -- --port 5175"
    # Cliente (5173)
    start_service "cliente" "$BASE_DIR/Yega-Cliente-MVP" "$PM dev -- --port 5173 || $PM run dev -- --port 5173"
    # Tienda (5174) — opcional
    if [ -d "$BASE_DIR/Yega-Tienda-MVP" ]; then
      start_service "tienda" "$BASE_DIR/Yega-Tienda-MVP" "$PM dev -- --port 5174 || $PM run dev -- --port 5174"
    fi
    echo "\nURLs (pueden variar si el puerto está ocupado):"
    echo "- API:        http://localhost:3001/health"
    echo "- Cliente:    http://127.0.0.1:5173"
    echo "- Repartidor: http://127.0.0.1:5175"
    echo "- Tienda:     http://127.0.0.1:5174"
    ;;
  stop)
    stop_service api
    stop_service cliente
    stop_service repartidor
    stop_service tienda
    echo "Servicios detenidos"
    ;;
  status)
    status_service api
    status_service cliente
    status_service repartidor
    status_service tienda
    echo "\nLogs en: $LOG_DIR"
    ;;
  *)
    echo "Uso: $0 {start|stop|status}"
    exit 1
    ;;
esac

