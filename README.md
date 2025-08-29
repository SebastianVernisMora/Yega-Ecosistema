# 🌟 Yega Ecosistema

**Yega** es una plataforma integral de delivery que conecta clientes, tiendas y repartidores en un ecosistema digital completo. Este monorepo contiene todas las aplicaciones y servicios que componen la plataforma.

---

## 📋 DOCUMENTACIÓN PRINCIPAL

**⚠️ ANTES DE EMPEZAR:** Consulta la documentación consolidada para entender el ecosistema:

### 📚 Guías Esenciales
- **[🤖 Guía de Agentes IA](./AGENTS.md)** - Roles, responsabilidades y flujo de trabajo
- **[📋 Checklist de Tareas](./docs/CHECKLIST_AGENTES_REPOS.md)** - Tareas específicas por agente y repo
- **[🏗️ Mapeo del Ecosistema](./ECOSISTEMA.md)** - Arquitectura y estructura completa
- **[📊 Plan de Trabajo Sprint 2](./PLAN_TRABAJO_SPRINT_2.md)** - Objetivos y cronograma actual

### 🔧 Documentación Técnica
- **[🌐 Política Cross-Repo](./docs/agents-global.md)** - Coordinación entre repositorios
- **[📈 Automatización de Proyectos](./docs/PROJECTS-AUTOMATION.md)** - GitHub Projects y workflows

---

## 🚀 Estado Actual - Sprint 2

**Sprint:** 2 - Integración y Funcionalidades Avanzadas  
**Duración:** 3-4 semanas  
**Objetivo:** Evolucionar desde mocks hacia plataforma integrada con funcionalidades críticas  

### 📊 Progreso por Componente

| **Componente** | **Estado** | **Prioridad** | **Objetivo Sprint 2** |
| :-------------- | :--------- | :------------ | :-------------------- |
| **🔧 Yega-API** | 🔄 En Desarrollo | **ALTA** | Backend real con BD, pagos, notificaciones |
| **📱 Yega-Cliente** | 🔄 En Desarrollo | **ALTA** | Integración completa, UX optimizada |
| **🏪 Yega-Tienda** | 🔄 En Desarrollo | **MEDIA** | Dashboard comercial, analytics |
| **🚚 Yega-Repartidor** | 🔄 En Desarrollo | **MEDIA** | Geolocalización, PWA offline |

### 🎯 Hitos Clave del Sprint
- **Semana 1:** Migración de mocks a API real
- **Semana 2:** Implementación de pagos y notificaciones
- **Semana 3:** Geolocalización y optimización
- **Semana 4:** Testing completo y preparación para producción

---

## 🏗️ Arquitectura del Ecosistema

### **Estructura de Submódulos**
```
Yega-Ecosistema/
├── 🔧 Yega-API/           # Backend TypeScript + Express + Prisma
├── 📱 Yega-Cliente/       # Frontend React (Consumidores)
├── 🏪 Yega-Tienda/        # Frontend React (Comerciantes)  
├── 🚚 Yega-Repartidor/    # Frontend React (Delivery)
└── 📚 docs/               # Documentación centralizada
```

### **Stack Tecnológico**
- **Backend:** Node.js + TypeScript + Express + Prisma + PostgreSQL
- **Frontend:** React 18 + TypeScript + Vite + Tailwind CSS
- **Testing:** Vitest + React Testing Library + Supertest
- **DevOps:** GitHub Actions + Docker + PM2

---

## 🤖 Desarrollo con Agentes IA

El ecosistema utiliza un sistema de **agentes IA especializados** para garantizar calidad y coordinación:

### **👥 Roles de Agentes**
- **🔨 Jules:** Implementación core y funcionalidades base
- **✨ Gemini:** QA, pulido y optimización de UX
- **📋 Codex:** Revisión final, PRs y documentación

### **🔄 Flujo de Trabajo**
1. **Jules** implementa funcionalidades base
2. **Gemini** refina calidad y experiencia
3. **Codex** revisa, documenta y crea PRs

**📖 Guía Completa:** [AGENTS.md](./AGENTS.md)

---

## 🛠️ Configuración Inicial

### **Prerrequisitos**
- Node.js 18+ y pnpm
- PostgreSQL 14+
- Git con soporte para submódulos

### **Instalación Rápida**
```bash
# 1. Clonar con submódulos
git clone --recurse-submodules <URL_DEL_REPO_YEGA_ECOSISTEMA>
cd Yega-Ecosistema

# 2. Instalar dependencias globales
pnpm install

# 3. Configurar e inicializar API
./bootstrap_yega_api.sh

# 4. Instalar dependencias en todos los submódulos
./yega_orchestrator.sh install
```

### **Desarrollo Local**
```bash
# Terminal 1: API Backend
cd Yega-API && pnpm dev          # Puerto 3000

# Terminal 2: Cliente Frontend  
cd Yega-Cliente && pnpm dev      # Puerto 5173

# Terminal 3: Tienda Frontend
cd Yega-Tienda && pnpm dev       # Puerto 5174

# Terminal 4: Repartidor Frontend
cd Yega-Repartidor && pnpm dev   # Puerto 5175
```

### 🧪 Testing MVP y Automatización
- Entorno rápido para demos locales en `Testing-MVP/` con clones: `Yega-API-MVP`, `Yega-Cliente-MVP`, `Yega-Tienda-MVP`, `Yega-Repartidor-MVP`.
- Arranque/stop/status de todos los servicios del MVP:

```bash
bash Testing-MVP/bootstrap_mvp.sh start   # API (3001), Cliente (5173), Repartidor (5175), Tienda (5174)
bash Testing-MVP/bootstrap_mvp.sh status  # estado y logs
bash Testing-MVP/bootstrap_mvp.sh stop    # detener
```

- Automatización de pruebas por repo (para Codex Web): repos `Yega-*-DEV` contienen `TEST_CHECKLIST.md` y `scripts/test_mvp.sh`.
  - Ejecuta: `bash scripts/test_mvp.sh` (install → lint → test → build → reporte en `docs/`).
  - Más info: `docs/TESTING_AUTOMATION.md` y `Testing-MVP/README.md`.

---

## 📊 Métricas y Objetivos

### **KPIs Técnicos Sprint 2**
- **⚡ Performance API:** < 200ms promedio
- **🧪 Testing Coverage:** API >70%, Frontends >60%
- **📱 Lighthouse Score:** >90 en todas las apps
- **🔄 Uptime:** >99.5% en desarrollo

### **Funcionalidades Objetivo**
- ✅ **Autenticación JWT** completa
- 🔄 **Sistema de Pagos** (Stripe integration)
- 🔄 **Notificaciones Push** en tiempo real
- 🔄 **Geolocalización** y tracking
- 🔄 **PWA Capabilities** offline

---

## 🚨 Issues y Soporte

### **Canales de Comunicación**
- **🐛 Bugs:** GitHub Issues en repo correspondiente
- **🤝 Coordinación:** Handoffs estructurados entre agentes
- **🆘 Emergencias:** Escalación inmediata

### **Troubleshooting Común**
```bash
# Limpiar dependencias
rm -rf node_modules && pnpm install

# Actualizar submódulos
git submodule update --init --recursive

# Reset base de datos
cd Yega-API && pnpm db:reset && pnpm db:seed
```

---

## 📈 Roadmap

### **🎯 Sprint 2 (Actual)**
- Integración completa API-Frontend
- Sistema de pagos funcional
- Notificaciones en tiempo real

### **🚀 Sprint 3 (Próximo)**
- Optimización de performance
- Testing automatizado completo
- Preparación para producción

### **🌟 Futuro**
- Deployment en producción
- Monitoreo y analytics avanzados
- Escalabilidad y optimización

---

## 📞 Contacto y Contribución

### **Para Desarrolladores**
1. **Lee la documentación:** [AGENTS.md](./AGENTS.md)
2. **Revisa las tareas:** [CHECKLIST_AGENTES_REPOS.md](./docs/CHECKLIST_AGENTES_REPOS.md)
3. **Sigue el flujo:** Implementación → QA → PR

### **Para Stakeholders**
- **Estado del Proyecto:** [PLAN_TRABAJO_SPRINT_2.md](./PLAN_TRABAJO_SPRINT_2.md)
- **Arquitectura:** [ECOSISTEMA.md](./ECOSISTEMA.md)
- **Métricas:** Dashboards en cada submódulo

---

## 📄 Licencia

Este proyecto se distribuye bajo la licencia [MIT](./LICENSE).

---

**🔄 Última Actualización:** Diciembre 2024  
**📋 Mantenido por:** Equipo de Agentes IA Yega  
**📊 Sprint Actual:** 2 - Integración y Funcionalidades Avanzadas
