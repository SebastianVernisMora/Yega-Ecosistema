# 🤖 GUÍA DE AGENTES IA - ECOSISTEMA YEGA

**Versión:** 2.0  
**Fecha:** Diciembre 2024  
**Sprint Actual:** 2 - Integración y Funcionalidades Avanzadas  

---

## 📋 DOCUMENTACIÓN PRINCIPAL

**⚠️ IMPORTANTE:** Esta es la guía consolidada para agentes IA. Para tareas específicas por agente y repositorio, consulta:
- **Checklist Maestro:** [`docs/CHECKLIST_AGENTES_REPOS.md`](./docs/CHECKLIST_AGENTES_REPOS.md)
- **Política Cross-Repo:** [`docs/agents-global.md`](./docs/agents-global.md)
- **Mapeo del Ecosistema:** [`ECOSISTEMA.md`](./ECOSISTEMA.md)

---

## 🏗️ ESTRUCTURA DEL ECOSISTEMA

### **Repositorio Raíz (`Yega-Ecosistema`)**
- **Propósito:** Orquestación y documentación global
- **Contenido:** Scripts de gestión, documentación consolidada, configuración de submódulos
- **Archivos Clave:** 
  - `yega_orchestrator.sh` - Script de orquestación principal
  - `bootstrap_yega_api.sh` - Inicialización del backend
  - `docs/` - Documentación centralizada del ecosistema

### **Submódulos de Desarrollo**
```
Yega-Ecosistema/
├── Yega-API/           # Backend TypeScript + Express + Prisma
├── Yega-Cliente/       # Frontend React (Consumidores)
├── Yega-Tienda/        # Frontend React (Comerciantes)
└── Yega-Repartidor/    # Frontend React (Delivery)
```

---

## 🎯 ROLES Y RESPONSABILIDADES POR AGENTE

### **Jules - Implementación Core**
**Especialización:** Desarrollo de funcionalidades base y contratos de API

#### Responsabilidades Principales:
- **Yega-API:** Implementar endpoints, esquemas de BD, autenticación
- **Frontends:** Componentes base, integración con API, flujos principales
- **Coordinación:** Crear handoffs entre repositorios

#### Comandos Frecuentes:
```bash
# API Development
cd Yega-API && pnpm install && pnpm dev

# Frontend Development  
cd Yega-Cliente && pnpm install && pnpm dev
cd Yega-Tienda && pnpm install && pnpm dev
cd Yega-Repartidor && pnpm install && pnpm dev
```

### **Gemini - QA y Pulido**
**Especialización:** Calidad, refinamiento y optimización

#### Responsabilidades Principales:
- **Calidad de Código:** Tipado, validaciones, manejo de errores
- **UX/UI:** Accesibilidad, performance, experiencia de usuario
- **Testing:** Estabilización de pruebas, cobertura

#### Comandos Frecuentes:
```bash
# Testing y Linting
pnpm lint && pnpm test
pnpm build && pnpm preview

# Performance Analysis
npm run analyze
lighthouse <url>
```

### **Codex - Revisión Final y PRs**
**Especialización:** Documentación, PRs y preparación para producción

#### Responsabilidades Principales:
- **Documentación:** READMEs, guías de deployment, ejemplos
- **Pull Requests:** Revisión final, merge, coordinación
- **Producción:** Configuración de CI/CD, monitoreo

#### Comandos Frecuentes:
```bash
# Build y Deploy
pnpm build
docker build -t yega-api .
gh pr create --title "feat: nueva funcionalidad"
```

---

## 🔄 FLUJO DE TRABAJO MULTI-REPO

### **Política de Desarrollo**
1. **Un Agente, Un Repo:** Cada agente opera solo en su repositorio asignado
2. **Handoffs Estructurados:** Comunicación entre repos vía issues con checklist
3. **Un PR por Tema:** Cambios atómicos y revisables
4. **Branch Strategy:** `feat/*` o `docs/*` contra `dev`

### **Coordinación Cross-Repo**
```mermaid
flowchart LR
  subgraph API["🔧 Yega-API"]
    J1[Jules: Endpoints] --> G1[Gemini: QA]
    G1 --> C1[Codex: PR]
  end
  
  subgraph Cliente["📱 Yega-Cliente"]
    J2[Jules: UI] --> G2[Gemini: UX]
    G2 --> C2[Codex: PR]
  end
  
  subgraph Tienda["🏪 Yega-Tienda"]
    J3[Jules: Dashboard] --> G3[Gemini: Polish]
    G3 --> C3[Codex: PR]
  end
  
  subgraph Repartidor["🚚 Yega-Repartidor"]
    J4[Jules: Delivery] --> G4[Gemini: Mobile]
    G4 --> C4[Codex: PR]
  end
  
  API -.->|Handoff| Cliente
  API -.->|Handoff| Tienda  
  API -.->|Handoff| Repartidor
```

---

## 🛠️ STACK TECNOLÓGICO Y CONVENCIONES

### **Backend (Yega-API)**
- **Runtime:** Node.js + TypeScript (ES2022, ESM)
- **Framework:** Express.js
- **Base de Datos:** Prisma ORM + PostgreSQL/MySQL
- **Testing:** Vitest + Supertest
- **Documentación:** OpenAPI 3.0

### **Frontends (Cliente/Tienda/Repartidor)**
- **Framework:** React 18 + TypeScript
- **Build Tool:** Vite
- **Styling:** Tailwind CSS
- **State Management:** React Query + Context
- **Testing:** Vitest + React Testing Library

### **Convenciones de Código**
```typescript
// Naming Conventions
// Files: kebab-case
user-profile.component.tsx

// Components: PascalCase  
export const UserProfile: React.FC = () => {}

// Variables/Functions: camelCase
const getUserData = async (userId: string) => {}

// Constants: SCREAMING_SNAKE_CASE
const API_BASE_URL = process.env.VITE_API_URL
```

### **Estructura de Directorios**
```
src/
├── components/     # Componentes reutilizables
├── pages/         # Vistas principales
├── hooks/         # Custom hooks
├── lib/           # Utilidades y configuración
├── types/         # Definiciones de tipos
└── __tests__/     # Tests organizados por feature
```

---

## 🧪 ESTRATEGIA DE TESTING

### **Cobertura Objetivo**
- **Yega-API:** > 70% (crítico para estabilidad)
- **Frontends:** > 60% (enfoque en flujos principales)

### **Tipos de Testing**
```bash
# Unit Tests
pnpm test:unit

# Integration Tests  
pnpm test:integration

# E2E Tests
pnpm test:e2e

# Performance Tests
pnpm test:performance
```

### **Automatización (Codex Web) y MVP local**
- Repos `Yega-*-DEV` contienen `TEST_CHECKLIST.md` y `scripts/test_mvp.sh` para ejecutar lint/tests/build con un solo comando y generar reporte en `docs/`.
- Para demos rápidas del MVP, usar `Testing-MVP/bootstrap_mvp.sh` para levantar API/Frontends y validar geolocalización y tracking en vivo.

### **Buenas Prácticas**
- **API:** Mock de servicios externos, tests de contratos
- **Frontend:** Mock de API calls, tests de componentes críticos
- **E2E:** Flujos de usuario completos, casos de borde

---

## 📝 COMMITS Y PULL REQUESTS

### **Convención de Commits**
```bash
# Formato: tipo(alcance): descripción breve
feat(api): implementar autenticación JWT
fix(cliente): corregir error en checkout
docs(global): actualizar guía de agentes
test(tienda): añadir tests para dashboard
```

### **Tipos de Commit**
- `feat`: Nueva funcionalidad
- `fix`: Corrección de bug
- `docs`: Documentación
- `style`: Formato, no afecta lógica
- `refactor`: Refactoring sin cambio funcional
- `test`: Añadir o modificar tests
- `chore`: Tareas de mantenimiento

### **Pull Request Template**
```markdown
## 📋 Resumen
Descripción clara del cambio

## 🔗 Issue Relacionado  
Closes #123

## 🧪 Testing
- [ ] Tests unitarios pasando
- [ ] Tests de integración pasando
- [ ] Probado manualmente

## 📸 Evidencia
Screenshots/GIFs para cambios de UI
Ejemplos curl para cambios de API

## ⚠️ Riesgos
Posibles efectos secundarios o breaking changes
```

---

## 🔒 SEGURIDAD Y CONFIGURACIÓN

### **Variables de Entorno**

#### Yega-API
```bash
DATABASE_URL="postgresql://user:pass@localhost:5432/yega"
JWT_SECRET="your-super-secret-key"
JWT_REFRESH_SECRET="your-refresh-secret"
PORT=3000
CORS_ORIGINS="http://localhost:5173,http://localhost:5174"
STRIPE_SECRET_KEY="sk_test_..."
REDIS_URL="redis://localhost:6379"
```

#### Frontends
```bash
VITE_API_URL="http://localhost:3000"
VITE_STRIPE_PUBLIC_KEY="pk_test_..."
VITE_FIREBASE_CONFIG="{...}"
VITE_MAPS_API_KEY="your-maps-key"
```

### **Buenas Prácticas de Seguridad**
- ✅ Usar `.env.example` para documentar variables requeridas
- ✅ Nunca commitear secretos reales
- ✅ Validar todos los inputs del usuario
- ✅ Implementar rate limiting en APIs
- ✅ Usar HTTPS en producción

---

## 🚀 COMANDOS DE DESARROLLO

### **Inicialización Completa**
```bash
# Clonar con submódulos
git clone --recurse-submodules <repo-url>
cd Yega-Ecosistema

# Instalar dependencias en todos los proyectos
./yega_orchestrator.sh install

# Inicializar base de datos
./bootstrap_yega_api.sh
```

### **Desarrollo Diario**
```bash
# API
cd Yega-API
pnpm dev          # Desarrollo con hot reload
pnpm test:watch   # Tests en modo watch
pnpm db:studio    # Prisma Studio para BD

# Frontends (en terminales separadas)
cd Yega-Cliente && pnpm dev     # Puerto 5173
cd Yega-Tienda && pnpm dev      # Puerto 5174  
cd Yega-Repartidor && pnpm dev  # Puerto 5175
```

### **Build y Deploy**
```bash
# Build de producción
pnpm build

# Preview local
pnpm preview

# Deploy (configurar según plataforma)
pnpm deploy
```

---

## 📊 MÉTRICAS Y MONITOREO

### **KPIs Técnicos**
- **Performance API:** < 200ms tiempo de respuesta promedio
- **Uptime:** > 99.5%
- **Bundle Size:** < 500KB inicial por frontend
- **Lighthouse Score:** > 90 en todas las métricas

### **Herramientas de Monitoreo**
```bash
# Performance
npm run analyze
lighthouse --view <url>

# Bundle Analysis
npm run build:analyze

# Testing Coverage
npm run test:coverage
```

---

## 🆘 TROUBLESHOOTING COMÚN

### **Problemas de Desarrollo**
```bash
# Limpiar dependencias
rm -rf node_modules package-lock.json
pnpm install

# Reset de base de datos
pnpm db:reset
pnpm db:seed

# Limpiar cache de build
pnpm clean
```

### **Issues de Submódulos**
```bash
# Actualizar submódulos
git submodule update --init --recursive

# Sincronizar cambios
git submodule foreach git pull origin dev
```

---

## 📞 ESCALACIÓN Y SOPORTE

### **Canales de Comunicación**
- **Issues Técnicos:** GitHub Issues en repo correspondiente
- **Coordinación:** Handoffs estructurados entre repos
- **Emergencias:** Escalación inmediata al lead técnico

### **Herramientas de Respaldo**
- **Blackbox/Qwen/Warp:** Solo para análisis profundo o bloqueos críticos
- **Copilot:** Asistencia en desarrollo cuando sea necesario

---

**📚 Documentación Relacionada:**
- [Checklist de Tareas por Agente](./docs/CHECKLIST_AGENTES_REPOS.md)
- [Mapeo del Ecosistema](./ECOSISTEMA.md)
- [Plan de Trabajo Sprint 2](./PLAN_TRABAJO_SPRINT_2.md)
- [Política Cross-Repo](./docs/agents-global.md)

**🔄 Última Actualización:** Diciembre 2024  
**👥 Mantenido por:** Codex (coordinación general)
