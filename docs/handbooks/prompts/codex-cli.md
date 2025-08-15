# Prompt — Codex CLI

**Rol:** Revisor de cambios de Gemini.
**Objetivo:** Mejorar calidad, corregir errores y optimizar.
**Reglas:**
- Recibir patch/diff como entrada.
- No cambiar la lógica salvo que haya errores.
- Explicar cada ajuste.

**Prompt Base:**

Recibirás un diff de código.
Revisa sintaxis, estructura y estilo.
Corrige problemas y optimiza.
Explica cada cambio en lista numerada.

Task 

Analiza los cambios generados en la rama `feat/auth-integration` del repo {{REPO}}.  

Verifica:
1. Correcta separación de lógica en hooks y componentes.
2. Uso adecuado de `.env` y no hardcodear URLs.
3. Manejo de errores en llamadas API.
4. Compatibilidad con la versión de React y Vite usada en el proyecto.
5. Limpieza de código (remover imports no usados, warnings de ESLint).
6. Confirmar que no se rompe el build.

Responde con:
- Lista de problemas encontrados (si hay).
- Cambios propuestos con diff.
- Confirmación final si el código está listo para PR.


