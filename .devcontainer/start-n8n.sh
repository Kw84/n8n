#!/usr/bin/env bash
set -euo pipefail

PORT=5678
HOST="0.0.0.0"

# pasta de dados persiste no workspace
export N8N_USER_FOLDER="${N8N_USER_FOLDER:-$PWD/.n8n-data}"

# defina um Secret N8N_ENCRYPTION_KEY nos Settings → Secrets → Codespaces; este fallback é só p/ dev
export N8N_ENCRYPTION_KEY="${N8N_ENCRYPTION_KEY:-changeme-dev-only}"

# evita iniciar duas vezes (com fallback caso não exista pgrep)
if command -v pgrep >/dev/null 2>&1; then
  if pgrep -fa "n8n start" >/dev/null 2>&1; then
    echo "n8n já está rodando; não vou iniciar outro processo."
    exit 0
  fi
else
  if ps -ef | grep -v grep | grep -q "n8n start"; then
    echo "n8n já está rodando; não vou iniciar outro processo."
    exit 0
  fi
fi

echo "Iniciando n8n em ${HOST}:${PORT}..."
exec n8n start --host "$HOST" --port "$PORT"
