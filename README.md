# 🚀 n8n no GitHub Codespaces

Este repositório permite rodar o [n8n](https://n8n.io) diretamente no **GitHub Codespaces**, sem precisar instalar nada localmente.

---

## 📦 Pré-requisitos

1. Conta no **GitHub**.
2. Acesso ao **GitHub Codespaces** (pode ser limitado em contas gratuitas).
3. Fazer o **fork** deste repositório para a sua conta.

---

## ⚙️ Configuração dos Secrets no GitHub

Antes de abrir o Codespace, configure os **Secrets**:

1. Vá em **Settings → Secrets and variables → Codespaces**.
2. Clique em **New repository secret** e adicione:

| Nome               | Descrição                                                             | Exemplo                                |
|--------------------|------------------------------------------------------------------------|----------------------------------------|
| `N8N_ENCRYPTION_KEY` | Chave de criptografia obrigatória para senhas e credenciais no n8n.   | `minha-chave-super-secreta`            |

> ⚠️ **Importante:** Nunca versione ou exponha essa chave.  
Ela garante a segurança das credenciais armazenadas no n8n.

---

## 🏗️ Estrutura do Repositório

n8n/
├─ .devcontainer/
│  ├─ devcontainer.json   # Configura imagem base, portas e inicialização
│  └─ start-n8n.sh        # Script de inicialização do n8n
├─ .gitignore             # Ignora dados, credenciais e arquivos sensíveis
└─ README.md              # Documentação


---

## ▶️ Como usar

1. Faça o **Fork** do repositório.
2. Configure os **Secrets**.
3. Crie o **Codespace**.
4. Aguarde a instalação automática do n8n.
5. Acesse pelo **Port 5678** → abrirá a interface web do n8n.
6. Crie seus **workflows**.
7. Se o Codespace hibernar, basta reabrir e acessar novamente.

---

## ⏳ Tempo de Atividade do Codespaces

- Por padrão, o Codespaces **hiberna após 30 minutos de inatividade**.  
- É possível ajustar:
  - Vá em **Settings → Codespaces → Idle timeout**.
  - Escolha um tempo maior (até **240 minutos** = 4 horas).  

⚠️ Mesmo ajustando, ao encerrar o Codespace manualmente ele será parado.

---

## 🔒 Segurança

- Apenas você terá acesso ao seu Codespace e à interface do n8n.  
- Outros usuários não conseguem criar contas nem acessar o seu ambiente.  
- Cada pessoa que quiser usar deve **fazer o fork e rodar seu próprio Codespace**.  

---

## 🧩 Fluxo de Uso (resumido)

1. **Fork** do repositório.  
2. Configurar **Secrets**.  
3. Criar **Codespace**.  
4. Acessar porta **5678**.  
5. Criar workflows.  
6. Reabrir Codespace quando hibernar.  

---

## 💡 Dicas úteis

- Para evitar expor dados sensíveis, **não edite o `.gitignore`** sem saber o que está fazendo.  
- Use o Codespace apenas para desenvolvimento/testes.  
- Para produção, o ideal é usar **Docker** ou **servidor dedicado**.  

---

✍️ Autor: *Kelber Weike*

