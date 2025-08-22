# 1) instalar n8n (se ainda não estiver instalado)
npm i -g n8n@1.106.3

# 2) persistência dos dados no workspace
export N8N_USER_FOLDER="$PWD/.n8n-data"
mkdir -p "$N8N_USER_FOLDER"

# 3) chave de criptografia (use um segredo forte; para teste, dá para exportar assim)
export N8N_ENCRYPTION_KEY="coloque-uma-chave-bem-forte-aqui"

# 4) variáveis específicas do Codespaces (normalmente já vêm do ambiente)
export PORT=5678
export WEBHOOK_URL="https://${CODESPACE_NAME}-${PORT}.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}/"
export N8N_HOST="${CODESPACE_NAME}-${PORT}.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
export N8N_PROTOCOL="https"
export N8N_PORT="$PORT"

# 5) subir o n8n
n8n start --host 0.0.0.0 --port "$PORT"
