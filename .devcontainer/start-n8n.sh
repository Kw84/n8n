#!/usr/bin/env bash
set -euo pipefail

# pasta de dados do n8n dentro do workspace (persiste enquanto o Codespace existir)
export N8N_USER_FOLDER="${N8N_USER_FOLDER:-$PWD/.n8n-data}"

# exige a chave de criptografia (defina como Secret no Codespaces)
: "${N8N_ENCRYPTION_KEY:?Defina o Secret N8N_ENCRYPTION_KEY em Settings → Secrets → Codespaces}"

echo "Node $(node -v) | n8n $(n8n -v)"

# ===== Configura a URL pública do Codespaces para webhooks =====
# Ex.: https://<CODESPACE_NAME>-5678.<GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN>
if [[ -n "${CODESPACE_NAME:-}" && -n "${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN:-}" ]]; then
  PORT="${PORT:-5678}"
  PUBLIC_HOST="${CODESPACE_NAME}-${PORT}.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
  export N8N_PROTOCOL="https"
  export WEBHOOK_URL="https://${PUBLIC_HOST}"
  export N8N_EDITOR_BASE_URL="https://${PUBLIC_HOST}"
  echo "WEBHOOK_URL: ${WEBHOOK_URL}"
else
  echo "AVISO: variáveis do Codespaces não disponíveis; se precisar de webhooks, defina WEBHOOK_URL e N8N_EDITOR_BASE_URL manualmente."
fi
# ===============================================================

echo "Iniciando n8n em 0.0.0.0:5678 (dados em ${N8N_USER_FOLDER})"
exec n8n start --host 0.0.0.0 --port 5678
