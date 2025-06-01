#!/bin/bash

echo "📦 Lendo configurações do config.json..."

ENV_NAME=$(jq -r '.environment_name' config.json)

# Criar ambiente virtual
echo "🛠️ Criando ambiente virtual: $ENV_NAME"
python3 -m venv $ENV_NAME

# Ativar ambiente virtual
source $ENV_NAME/bin/activate

# Atualizar pip
echo "🔧 Atualizando pip..."
pip install --upgrade pip

# Executar script Python para instalar libs e gerenciar otimizações
python3 install_python.py
