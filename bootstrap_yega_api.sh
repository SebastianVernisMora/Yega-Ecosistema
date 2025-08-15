#!/usr/bin/env bash
set -euo pipefail

ROOT="$(pwd)"
API_DIR="Yega-API"

echo "→ Verificando que estás en la raíz del ecosistema..."
test -d "$API_DIR" || { echo "❌ No existe $API_DIR aquí. Ubícate en ~/Yega/Yega-Ecosistema"; exit 1; }

cd "$API_DIR"

echo "→ Creando estructura de carpetas..."
mkdir -p src/routes prisma

echo "→ Creando package.json (si no existe)..."
if [ -f package.json ]; then
  echo "  • package.json ya existe, no se sobreescribe."
else
  cat > package.json <<'JSON'
{
  "name": "yega-api",
  "private": true,
  "type": "module",
  "scripts": {
    "dev": "tsx watch src/index.ts",
    "build": "tsc -p tsconfig.json",
    "start": "node dist/index.js",
    "lint": "eslint ."
  },
  "dependencies": {
    "@prisma/client": "^5.18.0",
    "bcryptjs": "^2.4.3",
    "cors": "^2.8.5",
    "dotenv": "^16.4.5",
    "express": "^4.19.2",
    "express-openapi-validator": "^5.0.6",
    "helmet": "^7.1.0",
    "jsonwebtoken": "^9.0.2",
    "mysql2": "^3.11.0",
    "pino": "^9.0.0",
    "pino-pretty": "^11.2.2",
    "prisma": "^5.18.0"
  },
  "devDependencies": {
    "@types/bcryptjs": "^2.4.2",
    "@types/express": "^4.17.21",
    "@types/jsonwebtoken": "^9.0.6",
    "eslint": "^9.0.0",
    "tsx": "^4.19.0",
    "typescript": "^5.9.0"
  }
}
JSON
fi

echo "→ Creando tsconfig.json (si no existe)..."
if [ -f tsconfig.json ]; then
  echo "  • tsconfig.json ya existe, no se sobreescribe."
else
  cat > tsconfig.json <<'JSON'
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ES2022",
    "moduleResolution": "Bundler",
    "outDir": "dist",
    "rootDir": "src",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true
  },
  "include": ["src"]
}
JSON
fi

echo "→ Creando .env.example (si no existe)..."
if [ -f .env.example ]; then
  echo "  • .env.example ya existe, no se sobreescribe."
else
  cat > .env.example <<'ENV'
NODE_ENV=staging
PORT=3001

# MariaDB/MySQL
DATABASE_URL="mysql://usuario:password@host:puerto/yega"

# JWT
JWT_SECRET=super-secreto
JWT_EXPIRES=7d

# CORS (desarrollo local)
CORS_ORIGINS=http://127.0.0.1:5173,http://127.0.0.1:5174,http://127.0.0.1:5175
ENV
fi

echo "→ Generando prisma/schema.prisma (si no existe)..."
if [ -f prisma/schema.prisma ]; then
  echo "  • prisma/schema.prisma ya existe, no se sobreescribe."
else
  cat > prisma/schema.prisma <<'PRISMA'
datasource db { provider = "mysql"; url = env("DATABASE_URL") }
generator client { provider = "prisma-client-js" }

model User {
  id        String   @id @default(uuid())
  email     String   @unique
  password  String
  role      String   @default("customer") // admin | store | delivery
  createdAt DateTime @default(now())
}

model Store {
  id        String   @id @default(uuid())
  name      String
  createdAt DateTime @default(now())
  products  Product[]
}

model Product {
  id          String   @id @default(uuid())
  name        String
  description String?
  price       Decimal  @db.Decimal(10,2)
  store       Store    @relation(fields: [storeId], references: [id])
  storeId     String
  createdAt   DateTime @default(now())
}

model Order {
  id        String   @id @default(uuid())
  user      User     @relation(fields: [userId], references: [id])
  userId    String
  createdAt DateTime @default(now())
  items     Json
  status    String   @default("pending")
}
PRISMA
fi

echo "→ Creando src/index.ts (si no existe)..."
if [ -f src/index.ts ]; then
  echo "  • src/index.ts ya existe, no se sobreescribe."
else
  cat > src/index.ts <<'TS'
import 'dotenv/config';
import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import pino from 'pino';
import path from 'node:path';
import { middleware as openApi } from 'express-openapi-validator';

const log = pino({ transport: { target: 'pino-pretty' } });
const app = express();

const PORT = Number(process.env.PORT || 3001);
const origins = (process.env.CORS_ORIGINS ?? '').split(',').filter(Boolean);

app.use(helmet());
app.use(cors({ origin: origins.length ? origins : true, credentials: true }));
app.use(express.json());

// Validación por OpenAPI (usa tu contrato existente)
const spec = path.join(process.cwd(), 'contracts', 'openapi.yaml');
app.use(
  openApi({
    apiSpec: spec,
    validateRequests: true,
    validateResponses: false
  })
);

// Rutas mínimas
app.get('/health', (_req, res) => res.json({ ok: true, ts: new Date().toISOString() }));

// TODO: Implementar auth/catalog/orders/delivery conforme al contrato

// Manejo de errores
// @ts-ignore
app.use((err, _req, res, _next) => {
  const status = err.status || err.statusCode || 500;
  const message = err.message || 'Internal error';
  log.error({ status, message, errors: err.errors });
  res.status(status).json({ error: message, details: err.errors ?? null });
});

app.listen(PORT, () => log.info(`YEGA API listening on :${PORT}`));
TS
fi

echo "→ Creando src/routes/health.ts (si no existe, opcional)..."
if [ ! -f src/routes/health.ts ]; then
  cat > src/routes/health.ts <<'TS'
import { Router } from 'express';
const r = Router();
r.get('/health', (_req, res) => res.json({ ok: true }));
export default r;
TS
fi

echo "→ Listo el esqueleto. Recuerda crear el archivo .env a partir de .env.example."
echo "→ Volviendo a la raíz del ecosistema..."
cd "$ROOT"

cat <<'NEXT'

───────────────────────────────────────────────────────────────────────────────
🚀 Siguientes pasos (comandos tal cual)
───────────────────────────────────────────────────────────────────────────────

# 1) Instala dependencias y prepara Prisma
pnpm -C Yega-API install
cp Yega-API/.env.example Yega-API/.env   # edita DATABASE_URL y JWT_SECRET
pnpm -C Yega-API prisma generate
pnpm -C Yega-API prisma migrate dev --name init

# 2) Build y arranque local con PM2
pnpm -C Yega-API build

# Agrega el bloque de yega-api en ecosystem.config.cjs si aún no está:
# {
#   name: "yega-api",
#   cwd: "Yega-API",
#   script: "pnpm",
#   args: "start",
#   env: {
#     NODE_ENV: "staging",
#     PORT: "3001",
#     CORS_ORIGINS: "http://127.0.0.1:5173,http://127.0.0.1:5174,http://127.0.0.1:5175"
#   }
# }

pm2 reload ecosystem.config.cjs --update-env
pm2 logs yega-api --lines 80

# 3) Reconstruye los 3 fronts apuntando al backend real
(cd Yega-Cliente    && VITE_API_URL=http://127.0.0.1:3001 pnpm build)
(cd Yega-Tienda     && VITE_API_URL=http://127.0.0.1:3001 pnpm build)
(cd Yega-Repartidor && VITE_API_URL=http://127.0.0.1:3001 pnpm build)
pm2 restart yega-cliente --update-env
pm2 restart yega-tienda  --update-env
pm2 restart yega-repartidor --update-env

# 4) (Opcional) Apaga el mock si sigue corriendo
pm2 delete yega-mock || true

# 5) Pruebas
curl -i http://127.0.0.1:3001/health
curl -I http://127.0.0.1:5173
curl -I http://127.0.0.1:5174
curl -I http://127.0.0.1:5175

# 6) Persistencia
pm2 save
# y (si quieres auto-arranque) pm2 startup systemd -u "$USER" --hp "$HOME"
NEXT

echo "✅ Bootstrap de Yega-API generado."
