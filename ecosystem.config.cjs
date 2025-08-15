// ecosystem.config.cjs
module.exports = {
  apps: [
    {
      name: "yega-cliente",
      cwd: "Yega-Cliente",
      script: "pnpm",
      args: "preview",
      env: { NODE_ENV: "staging", VITE_API_URL: "http://127.0.0.1:3001" }
    },
    {
      name: "yega-tienda",
      cwd: "Yega-Tienda",
      script: "pnpm",
      args: "preview",
      env: { NODE_ENV: "staging", VITE_API_URL: "http://127.0.0.1:3001" }
    },
    {
      name: "yega-repartidor",
      cwd: "Yega-Repartidor",
      script: "pnpm",
      args: "preview",
      env: { NODE_ENV: "staging", VITE_API_URL: "http://127.0.0.1:3001" }
    },
    {
      name: "yega-api",
      cwd: "Yega-API",
      script: "pnpm",
      args: "start",
      env: { NODE_ENV: "staging", PORT: "3001", CORS_ORIGINS: "http://127.0.0.1:5173,http://127.0.0.1:5174,http://127.0.0.1:5175" }
    }
  ]
};
