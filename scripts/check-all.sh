#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECTS=("Yega-API" "Yega-Cliente" "Yega-Tienda" "Yega-Repartidor")

usage() {
  cat <<'USAGE'
YEGA check-all — lint, type-check y tests en submódulos

Uso:
  scripts/check-all.sh [--no-test] [--fix] [--coverage] [--include-sdk]

Opciones:
  --no-test      Omite ejecución de tests
  --fix          Ejecuta lint con --fix cuando aplique
  --coverage     Usa script test:ci si existe
  --include-sdk  Incluye Yega-API/yega-api-client (SDK)

Notas:
  - Requiere pnpm instalado y dependencias en cada proyecto.
  - Ejecuta tsc --noEmit si existe tsconfig.json.
  - Detecta scripts por nombre en package.json; si no existen, los omite.
USAGE
}

NO_TEST=0
FIX=0
COVERAGE=0
INCLUDE_SDK=0
for arg in "$@"; do
  case "$arg" in
    --no-test) NO_TEST=1 ;;
    --fix) FIX=1 ;;
    --coverage) COVERAGE=1 ;;
    --include-sdk) INCLUDE_SDK=1 ;;
    -h|--help) usage; exit 0 ;;
  esac
done

if [[ "$INCLUDE_SDK" -eq 1 ]]; then
  PROJECTS+=("Yega-API/yega-api-client")
fi

bold() { printf "\033[1m%s\033[0m\n" "$*"; }
green() { printf "\033[32m%s\033[0m\n" "$*"; }
red() { printf "\033[31m%s\033[0m\n" "$*"; }

has_script() {
  local dir="$1" name="$2"
  [[ -f "$dir/package.json" ]] || return 1
  grep -q '"'"$name"'"[[:space:]]*:' "$dir/package.json"
}

run_repo() {
  local dir="$1"; pushd "$dir" >/dev/null
  bold "== $dir =="

  # Lint
  if has_script . lint; then
    echo "> Lint"; if [[ "$FIX" -eq 1 ]]; then pnpm -s lint --fix || true; else pnpm -s lint || true; fi
  else
    echo "(sin script lint)"
  fi

  # Type-check
  if [[ -f tsconfig.json ]]; then
    echo "> Type-check"; pnpm -s exec tsc --noEmit || true
  else
    echo "(sin tsconfig.json)"
  fi

  # Tests
  if [[ "$NO_TEST" -eq 1 ]]; then
    echo "> Tests omitidos (--no-test)"
  else
    if [[ "$COVERAGE" -eq 1 && $(has_script . test:ci && echo yes || echo no) == yes ]]; then
      echo "> Tests (coverage)"; pnpm -s test:ci || true
    elif has_script . test; then
      echo "> Tests"; pnpm -s test || true
    else
      echo "(sin script test)"
    fi
  fi

  popd >/dev/null
}

cd "$ROOT_DIR"
for p in "${PROJECTS[@]}"; do
  if [[ -d "$p" ]]; then run_repo "$p"; else red "Directorio no encontrado: $p"; fi
done

green "\nRevisión completa. Revisa mensajes arriba para detalles."

