#!/usr/bin/env bash
set -euo pipefail

# pasta de dados do n8n no workspace (persiste enquanto o Codespace existir)
export N8N_USER_FOLDER="${N8N_USER_FOLDER:-$PWD/.n8n-data}"

# chave de criptografia (exige o Secret; se faltar, falha com mensagem clara)
: "${N8N_ENCRYPTION_KEY:?Defina o Secret N8N_ENCRYPTION_KEY em Settings → Secrets → Codespaces}"

# evita iniciar duas vezes se o container reiniciar rápido
if pgrep -fa "n8n start" >/dev/null 2>&1; then
  echo "n8n já está rodando; não vou iniciar outro processo."
  exit 0
fi

echo "Iniciando n8n em 0.0.0.0:5678..."
n8n start --host 0.0.0.0 --port 5678
