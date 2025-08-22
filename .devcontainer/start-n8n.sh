#!/usr/bin/env bash
set -euo pipefail

PORT=${PORT:-5678}
HOST=${HOST:-"0.0.0.0"}

# dados do n8n persistem no workspace
export N8N_USER_FOLDER="${N8N_USER_FOLDER:-$PWD/.n8n-data}"
mkdir -p "$N8N_USER_FOLDER"

# Secret opcional — fallback só para dev
export N8N_ENCRYPTION_KEY="${N8N_ENCRYPTION_KEY:-changeme-dev-only}"

# evita iniciar duas vezes
if ps -ef | grep -v grep | grep -q "n8n start.*--port $PORT"; then
  echo "n8n já está rodando."
  exit 0
fi

echo "Iniciando n8n em ${HOST}:${PORT}..."

# usa o binário global se existir; senão, fallback via npx
if command -v n8n >/dev/null 2>&1; then
  n8n start --host "$HOST" --port "$PORT"
else
  echo "n8n global não encontrado; usando npx (fallback)."
  npx --yes n8n@1.106.3 start --host "$HOST" --port "$PORT"
fi
