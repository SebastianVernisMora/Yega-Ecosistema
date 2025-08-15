#!/usr/bin/env bash
# yega_orchestrator.sh
# Orquestador de prompts para Día 2 (y siguientes) en YEGA.
# Uso rápido:
#   chmod +x yega_orchestrator.sh
#   ./yega_orchestrator.sh prompt gemini --repo Yega-Cliente --api https://api.stg.yega.com.mx
#   ./yega_orchestrator.sh prompt codex  --repo Yega-Cliente
#   ./yega_orchestrator.sh prompt jules  --repo Yega-Cliente
#   ./yega_orchestrator.sh prompt blackbox --repo Yega-Cliente --error "CORS bloquea /auth/login"
#   ./yega_orchestrator.sh day2-plan

set -euo pipefail

red()   { printf "\033[31m%s\033[0m\n" "$*"; }
green() { printf "\033[32m%s\033[0m\n" "$*"; }
bold()  { printf "\033[1m%s\033[0m\n" "$*"; }

usage() {
  cat <<'USAGE'
YEGA Orchestrator — ayuda

Comandos:
  prompt gemini   --repo <REPO> [--api <URL_STAGING>]
  prompt codex    --repo <REPO>
  prompt jules    --repo <REPO>
  prompt blackbox --repo <REPO> --error "<DESCRIPCION>"

Extras:
  day2-plan              Muestra el plan del Día 2 (tareas por repo y entregables)
  snippet env-frontend   Imprime .env.example para front (Vite)
  snippet pr-template    Imprime checklist PR (docs)

Ejemplos:
  ./yega_orchestrator.sh prompt gemini --repo Yega-Cliente --api https://api.stg.yega.com.mx
  ./yega_orchestrator.sh prompt codex --repo Yega-API
  ./yega_orchestrator.sh day2-plan
USAGE
}

need_arg() {
  local name="$1" val="${2:-}"
  if [[ -z "${val}" ]]; then red "Falta argumento: ${name}"; exit 1; fi
}

render_gemini() {
  local repo="$1" api="${2:-}"
  need_arg "--repo" "$repo"
  cat <<EOF
Actúa como desarrollador full stack experto en React/Vite y APIs REST.
Repositorio actual: ${repo}.
Objetivo: Implementar login y registro conectando a la API en staging (${api:-<DEFINE VITE_API_URL>}).

Requisitos:
1. Formularios controlados:
   - Login: email, password
   - Registro: nombre, email, password
2. Hook de sesión \`useAuth()\` con:
   - login(email, password)
   - register(nombre, email, password)
   - logout()
3. Variables de entorno:
   - VITE_API_URL=${api:-<DEFINE>}
4. Llamadas API con manejo de errores (401/403/5xx) y toasts.
5. Rama de trabajo: \`feat/auth-integration\`. No tocar otros repos.

Formato de salida:
- Código funcional listo para pegar (archivos y rutas).
- Resumen de cambios y checklist.
EOF
}

render_codex() {
  local repo="$1"
  need_arg "--repo" "$repo"
  cat <<EOF
Analiza la rama \`feat/auth-integration\` del repo ${repo}.

Verifica:
1. Separación lógica (hooks vs componentes) y imports limpios.
2. Uso de \`.env\` (sin URLs hardcodeadas).
3. Manejo de errores y estados de carga en las llamadas.
4. Compatibilidad con React/Vite del proyecto.
5. Build sin warnings/errores.

Responde con:
- Lista de problemas (Bloqueantes / No bloqueantes).
- Diffs concretos de mejora.
- Confirmación final de listo para PR o acciones pendientes.
EOF
}

render_jules() {
  local repo="$1"
  need_arg "--repo" "$repo"
  cat <<EOF
Eres Jules. Trabajas solo en este repo (${repo}). Genera documentación (sin código).

Tareas:
1) \`docs/handoffs/index.md\`: marca "Login y Registro conectados a API" como COMPLETADO.
2) \`docs/implementacion.md\`: describe el flujo de login/registro, variables de entorno, endpoints consumidos.
3) \`CHANGELOG.md\`: agrega entrada "Integración inicial de auth con API en staging".
4) Prepara cuerpo de PR a \`dev\`:
   - Título: [docs] Actualización tras auth integration
   - Checklist DoR/DoD, Riesgos, Rollback

Salida:
- Archivos tocados con bullets.
- Cuerpo de PR listo para copiar.
EOF
}

render_blackbox() {
  local repo="$1" err="$2"
  need_arg "--repo" "$repo"; need_arg "--error" "$err"
  cat <<EOF
Problema actual: ${err}
Repositorio: ${repo}

Objetivo: Resolver manteniendo compatibilidad con API en staging y estructura vigente.

Requisitos:
- Diagnóstico de causa raíz (técnico y verificable).
- Dos soluciones viables; elegir una y justificar.
- Entregar patch/diff acotado y pasos para validar.

Formato de salida:
1) Diagnóstico
2) Solución elegida (por qué)
3) Código listo para pegar
4) Validación (pasos/resultados esperados)
EOF
}

render_day2() {
  cat <<'EOF'
Plan Día 2 — Objetivo: API operativa en STG y auth funcional en 3 fronts.

Yega-API
- Smoke test /auth/login y /auth/register
- PM2 en STG; validar /health y /ready
- CORS según docs/CORS-ORIGINS.md
- Logs iniciales (observabilidad)

Yega-Cliente
- Login/Registro conectados a STG
- .env con VITE_API_URL
- Rama feat/auth-integration

Yega-Tienda
- Login conectado + dashboard placeholder
- Rama feat/auth-integration

Yega-Repartidor
- Login conectado + lista asignables mock
- PWA base documentada
- Rama feat/auth-integration

Entregables
- PRs por repo (auth base)
- docs/handoffs/index.md actualizado
- Commits con footer AI-Usage
EOF
}

render_env_front() {
  cat <<'EOF'
# .env.example (front con Vite)
VITE_API_URL=https://api.stg.yega.com.mx
# Añade otras variables necesarias del front; no subas credenciales reales.
EOF
}

render_pr_template() {
  cat <<'EOF'
## Checklist
- [ ] Un solo objetivo/tema (auth base).
- [ ] Diff autocontenido (sin cross-repo).
- [ ] Manejo de errores (401/403/5xx) y toasts.
- [ ] Variables de entorno documentadas.
- [ ] AI-Usage: gemini=?, codex=?, jules=?, blackbox=?.

## Resumen
(Qué se hizo y por qué)

## Archivos tocados
(Listado breve)

## Riesgos y Rollback
(Riesgos y cómo revertir)

## Notas
(Refs a issues/PRs; handoffs)
EOF
}

main() {
  local cmd="${1:-}"; shift || true
  case "$cmd" in
    help|-h|--help|"") usage ;;
    prompt)
      local who="${1:-}"; shift || true
      local repo="" api="" error=""
      while [[ $# -gt 0 ]]; do
        case "$1" in
          --repo)  repo="${2:-}"; shift 2 ;;
          --api)   api="${2:-}"; shift 2 ;;
          --error) error="${2:-}"; shift 2 ;;
          *) red "Flag desconocida: $1"; exit 1 ;;
        esac
      done
      case "$who" in
        gemini)   render_gemini "$repo" "${api:-}";;
        codex)    render_codex  "$repo" ;;
        jules)    render_jules  "$repo" ;;
        blackbox) render_blackbox "$repo" "${error:-}" ;;
        *) red "Prompt desconocido: $who (gemini|codex|jules|blackbox)"; exit 1 ;;
      esac
      ;;
    day2-plan)           render_day2 ;;
    snippet)
      local what="${1:-}"; shift || true
      case "$what" in
        env-frontend)     render_env_front ;;
        pr-template)      render_pr_template ;;
        *) red "Snippet desconocido: $what"; exit 1 ;;
      esac
      ;;
    *)
      red "Comando desconocido: $cmd"; usage; exit 1 ;;
  esac
}

main "$@"

