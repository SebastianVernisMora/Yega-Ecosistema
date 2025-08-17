# Automatización de Projects (v2) – Ecosistema

Este monorepo coordina 4 repos con tableros de Projects v2 (a nivel de usuario):

- Sprint 1 - Yega-API
- Sprint 1 - Yega-Cliente
- Sprint 1 - Yega-Tienda
- Sprint 1 - Yega-Repartidor

Cada repo tiene un workflow en `.github/workflows/project-automation.yml` que mueve automáticamente el campo `Status` del Project cuando ocurren eventos de PRs e Issues.

## Estados automáticos
- PR abierto/listo con palabras de cierre (Closes/Fixes/Resolves #N): el Issue pasa a “In Progress”.
- PR mergeado: los Issues vinculados pasan a “Done”.
- Issue cerrado: pasa a “Done”.
- Issue reabierto: pasa a “Todo”.

## Cómo vincular PR ↔ Issue
Incluye en la descripción del PR una palabra clave de cierre, por ejemplo:

- Closes #123
- Fixes #123
- Resolves #123

El workflow detecta el vínculo y actualiza el Project.

## Etiquetas del sprint
Los Issues del sprint usan la etiqueta `sprint-1`.

## Backlog y tablero por repo
Cada repo mantiene:

- Backlog: `docs/ISSUES-Sprint-1.md`
- Tablero (To Do / In Progress / Done): `docs/BOARD-Sprint-1.md`

## Dónde ver los Projects
Projects v2 se gestionan a nivel de usuario (no “classic” por repo). Para verlos:

- GitHub > tu avatar > Your projects
- CLI: `gh project list --owner SebastianVernisMora`

## Operación y credenciales
- Los workflows usan `GH_PROJECT_TOKEN` (o `GITHUB_TOKEN`) para operar con la CLI `gh`.
- El token debe tener permisos `repo` y acceso a Projects v2.

## Extensiones posibles
- Detectar menciones simples (“#123”) para mover a “In Progress”.
- Crear un Project central “Sprint 1 - Ecosistema” que agregue issues de los 4 repos.

