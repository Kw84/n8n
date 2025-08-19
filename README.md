# ⚡ n8n no GitHub Codespaces

Este repositório contém a configuração mínima necessária para rodar o **[n8n](https://n8n.io/)** dentro do **GitHub Codespaces**, com **persistência de dados**, **segurança aplicada** e **setup automático**.  

Cada pessoa deve criar **sua própria instância** (via fork deste repositório) para manter **dados, credenciais e workflows isolados**.  

---

## ✅ Pré-requisitos

Antes de começar, você precisa:

1. Ter uma conta no **GitHub**.  
2. Ativar o recurso **GitHub Codespaces** na sua conta (disponível em planos gratuitos e pagos, com limite de horas/mês).  
3. Saber que o **Codespaces hiberna automaticamente** após inatividade (padrão: 30 minutos, configurável até 4h).  

---

## 📂 Estrutura do Repositório

n8n/
├─ .devcontainer/
│ ├─ devcontainer.json # Configura imagem base, portas e inicialização
│ └─ start-n8n.sh # Script de inicialização do n8n
├─ .gitignore # Ignora dados, credenciais e arquivos sensíveis
└─ README.md # Documentação

markdown
Copiar
Editar

---

## 🛠️ Passo 1: Fork do Repositório

1. Clique em **Fork** no canto superior direito.  
2. O repositório será copiado para sua conta.  

> ⚠️ **Importante:** nunca trabalhe direto no repositório original, sempre no seu fork.  

---

## 🔑 Passo 2: Configurar Secrets no Codespaces

Antes de criar o Codespace, defina seus **segredos de ambiente** (para segurança):

1. Vá em: **Settings → Codespaces → Secrets → New repository secret**  
2. Crie pelo menos:

| Nome | Valor | Obrigatório | Descrição |
|------|-------|-------------|-----------|
| `N8N_ENCRYPTION_KEY` | string aleatória e longa (ex.: `openssl rand -base64 32`) | ✅ | Criptografa credenciais salvas no n8n |

> 🔒 **Nunca** coloque esse valor no código ou faça commit.  
> Sempre use **Secrets do Codespaces**.  

---

## 💻 Passo 3: Criar o Codespace

1. No seu fork, clique em **Code → Codespaces → Create Codespace on main**.  
2. O Codespace será iniciado:  
   - Instala automaticamente o **n8n**.  
   - Configura a porta **5678**.  
   - Roda o script `start-n8n.sh`.  

---

## ▶️ Passo 4: Acessar o n8n

1. Após o Codespace iniciar, vá até a aba **Ports**.  
2. Localize a porta **5678 (n8n)**.  
3. Clique em **Open in Browser**.  
4. Faça login com o usuário/senha configurados (se ativou autenticação).  

---

## 🔄 Passo 5: Hibernação e Tempo de Atividade

- Por padrão, o **Codespaces hiberna após 30 minutos de inatividade**.  
- Para aumentar:  
  1. Vá em **GitHub → Settings → Codespaces → Default idle timeout**  
  2. Ajuste para até **4 horas** (máximo permitido).  

Quando o Codespace hiberna:  
- Seus dados permanecem salvos em `.n8n-data/`.  
- Ao reabrir, o `start-n8n.sh` reinicia automaticamente o n8n.  

---

## ⚙️ Arquivos Detalhados

### `.devcontainer/devcontainer.json`

- Define a imagem base (`Node.js 20`).  
- Expõe a porta `5678`.  
- Configura comandos pós-criação (`npm install -g n8n`).  
- Executa o script `start-n8n.sh`.  

### `.devcontainer/start-n8n.sh`

- Define a pasta persistente `.n8n-data/`.  
- Exige `N8N_ENCRYPTION_KEY`.  
- Evita múltiplas instâncias.  
- Inicia o n8n na porta `5678`.  

### `.gitignore`

- Impede versionamento de:  
  - **dados** (`.n8n`, `.n8n-data`, `database.sqlite`)  
  - **credenciais** (`.env`, `*.pem`, `*.key`, `secrets.*`)  
  - **logs temporários**  
  - **dependências** (`node_modules/`)  

---

## 📌 Boas Práticas

- Cada usuário deve criar **sua própria instância** (fork + Codespace).  
- Nunca exponha a porta **5678** como **Public** sem antes ativar autenticação.  
- Use sempre **Secrets** para variáveis sensíveis.  
- Se precisar reiniciar manualmente:  

```bash
bash .devcontainer/start-n8n.sh
🚦 Fluxo de Uso (resumido)
Fork do repositório.

Configurar Secrets.

Criar Codespace.

Acessar porta 5678.

Criar workflows.

Reabrir Codespace quando hibernar.
