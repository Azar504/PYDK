
# Backend Python Setup

Um instalador modular, automatizado e multiplataforma para ambientes Python focado em desenvolvimento backend. Detecção automática do sistema operacional, criação de ambiente virtual e instalação otimizada de bibliotecas essenciais.

## Arquitetura dos Arquivos
```
setup/
├── config.json         # Configurações gerais (libs, nome do ambiente, opções)
├── installer.sh        # Detecta SO, instala Python e dependências básicas
├── setup_shell.sh      # Cria ambiente virtual, lê config e chama install_python.py
├── install_python.py   # Gerencia RAM, instala libs em paralelo, otimiza processo
├── README.md           # Este manual
```

## Instalação

1. Clone o repositório:

2. Dê permissão de execução:

```chmod +x installer.sh setup_shell.sh```

3. Execute o instalador:

```./installer.sh```

## Funcionalidades

- Detecção inteligente de sistema operacional
  - Debian/Ubuntu
  - RedHat/CentOS/Fedora
  - MacOS
  - Windows (via WSL ou Git Bash)

- Instalação automática do Python, pip e venv

- Criação de ambiente virtual customizado

- Instalação paralela de bibliotecas essenciais
  - Usa todos os núcleos da CPU para acelerar a instalação

- Gerenciamento de memória
  - Verifica RAM antes da instalação para evitar gargalos

- 100% configurável via config.json

## Bibliotecas Default Incluídas

| Lib           | Descrição                                         |
|----------------|---------------------------------------------------|
| requests       | Requisições HTTP síncronas                       |
| httpx          | Requisições HTTP assíncronas                     |
| fastapi        | Framework web moderno e rápido                   |
| django         | Framework completo e robusto                     |
| flask          | Microframework simples e flexível                |
| sqlalchemy     | ORM poderoso                                      |
| pydantic       | Validação de dados com type hints                |
| python-dotenv  | Gerenciamento de variáveis de ambiente           |
| uvicorn        | ASGI server (FastAPI, etc.)                      |
| gunicorn       | WSGI server (Django, Flask)                      |
| celery         | Gerenciador de tarefas assíncronas               |
| redis          | Cliente Redis                                    |
| pymongo        | Cliente MongoDB                                  |
| pytz           | Suporte a timezone                               |
| passlib        | Hash seguro de senhas                            |
| bcrypt         | Criptografia de senhas                           |
| aiohttp        | Cliente HTTP assíncrono                          |
| jinja2         | Template engine                                   |
| pytest         | Framework de testes                              |
| loguru         | Logger bonito e poderoso                         |
| black          | Formatador automático de código                  |

## Configuração via config.json

Exemplo:
```
{
  "environment_name": "venv",
  "python_version": "3.10",
  "libs": ["requests", "fastapi", "sqlalchemy"],
  "optimize_memory": true,
  "parallel_install": true
}
```
- environment_name → Nome do ambiente virtual
- python_version → (Em desenvolvimento) Definir versão específica
- libs → Lista de bibliotecas a serem instaladas
- optimize_memory → Ativa verificação de RAM antes de instalar
- parallel_install → Instala libs em paralelo (mais rápido)

## Requisitos

- Linux / MacOS / WSL (Windows)
- bash, python3, pip, venv
- Dependências automáticas: jq (para parsear JSON no shell)

## Possíveis melhorias

- Suporte a Windows nativo (sem WSL)
- Logs avançados
- Suporte para Docker ou Podman
- Instalação opcional de bancos: PostgreSQL, MongoDB, Redis
- Interface CLI interativa

## Licença

Sob licença MIT. Use, modifique e queime a mediocridade sem restrições.
