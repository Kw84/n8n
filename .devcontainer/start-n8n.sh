#!/usr/bin/env bash
set -euo pipefail

PORT=5678
HOST="0.0.0.0"

# pasta de dados persiste no workspace
export N8N_USER_FOLDER="${N8N_USER_FOLDER:-$PWD/.n8n-data}"

# defina um Secret N8N_ENCRYPTION_KEY nos Settings → Secrets → Codespaces; este fallback é só p/ dev
export N8N_ENCRYPTION_KEY="${N8N_ENCRYPTION_KEY:-changeme-dev-only}"

# evita iniciar duas vezes
if pgrep -fa "n8n start" >/dev/null 2>&1; then
  echo "n8n já está rodando; não vou iniciar outro processo."
  exit 0
fi

# === URL pública do Codespaces ===
if [[ -n "${CODESPACE_NAME:-}" && -n "${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN:-}" ]]; then
  PUBLIC_URL="https://${CODESPACE_NAME}-${PORT}.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}/"
  export WEBHOOK_URL="${WEBHOOK_URL:-$PUBLIC_URL}"
  export N8N_HOST="${N8N_HOST:-${CODESPACE_NAME}-${PORT}.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}}"
  export N8N_PROTOCOL="${N8N_PROTOCOL:-https}"
  export N8N_PORT="${N8N_PORT:-$PORT}"
  export N8N_EDITOR_BASE_URL="${N8N_EDITOR_BASE_URL:-$PUBLIC_URL}"
  echo "WEBHOOK_URL: $WEBHOOK_URL"
else
  echo "⚠️ Variáveis do Codespaces não detectadas; WEBHOOK_URL não será setado automaticamente."
fi

echo "Iniciando n8n em ${HOST}:${PORT}..."
exec n8n start --host "$HOST" --port "$PORT"
