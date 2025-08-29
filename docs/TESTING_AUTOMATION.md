# Automatización de Testeos — Codex Web

## Repos cubiertos
- Yega-API-DEV
- Yega-Cliente-DEV
- Yega-Tienda-DEV
- Yega-Repartidor-DEV

## Scripts por repo
- `scripts/test_mvp.sh`: instala dependencias, lint, tests, build y smoke (API hace /health).

## Cómo ejecutar (Codex Web)
- Abrir repo correspondiente y ejecutar:
  - `bash scripts/test_mvp.sh`

## Salida
- Genera `docs/REPORTE_QA_LOCAL_<fecha>.md` dentro de cada repo.
