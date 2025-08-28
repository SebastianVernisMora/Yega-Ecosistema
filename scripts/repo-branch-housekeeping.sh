#!/usr/bin/env bash
set -euo pipefail

# Utilidad para alinear ramas por submódulo según política del sprint.
# Por defecto es "dry-run" (solo imprime). Use --apply para crear ramas locales.
# Opcionalmente use --push para hacer push de las ramas nuevas (requiere red y permisos).

APPLY=0
PUSH=0

usage() {
  cat <<'USAGE'
repo-branch-housekeeping — Crear/renombrar ramas feature por submódulo

Uso:
  scripts/repo-branch-housekeeping.sh [--apply] [--push]

Acciones:
  - Yega-Cliente: sugerir renombrar a feat/auth-integration
  - Yega-Tienda: crear feat/auth-integration desde rama actual
  - Yega-Repartidor: crear feat/auth-integration (mantener feat/map-navigation aparte)

Notas:
  - --apply crea ramas locales; --push corre git push -u origin <rama>.
  - No se hace fetch automático de remotos.
USAGE
}

for arg in "$@"; do
  case "$arg" in
    --apply) APPLY=1 ;;
    --push) PUSH=1 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Flag desconocida: $arg"; usage; exit 1 ;;
  esac
done

handle_repo() {
  local dir="$1" desired="$2"; pushd "$dir" >/dev/null
  local current
  current=$(git rev-parse --abbrev-ref HEAD)
  echo "[$dir] Rama actual: $current"

  if [[ "$current" == "$desired" ]]; then
    echo "[$dir] OK: ya estás en $desired"
  else
    echo "[$dir] Sugerido: trabajar en $desired"
    if [[ "$APPLY" -eq 1 ]]; then
      echo "[$dir] Creando rama local $desired desde $current..."
      git checkout -b "$desired"
      if [[ "$PUSH" -eq 1 ]]; then
        echo "[$dir] Haciendo push a origin/$desired..."
        git push -u origin "$desired"
      fi
    fi
  fi
  popd >/dev/null
}

echo "== Housekeeping de ramas (dry-run: $((1-APPLY)), push: $PUSH) =="

# Cliente: si está en feat/complete-authentication-system, crear feat/auth-integration
if [[ -d Yega-Cliente ]]; then
  pushd Yega-Cliente >/dev/null
  cur=$(git rev-parse --abbrev-ref HEAD)
  popd >/dev/null
  if [[ "$cur" == "feat/complete-authentication-system" ]]; then
    handle_repo "Yega-Cliente" "feat/auth-integration"
  else
    echo "[Yega-Cliente] Rama actual: $cur (no forzamos cambio)"
  fi
fi

# Tienda y Repartidor: asegurar feat/auth-integration existe
[[ -d Yega-Tienda ]] && handle_repo "Yega-Tienda" "feat/auth-integration"
[[ -d Yega-Repartidor ]] && handle_repo "Yega-Repartidor" "feat/auth-integration"

echo "Listo. Si usaste --apply y --push, crea PRs hacia dev con gh o GitHub UI."

