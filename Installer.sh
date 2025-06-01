#!/bin/bash

echo "🔍 Detectando sistema operacional..."

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ -f /etc/debian_version ]; then
        echo "🟦 Debian-based detected"
        sudo apt update
        sudo apt install -y python3 python3-venv python3-pip jq
    elif [ -f /etc/redhat-release ]; then
        echo "🟥 RedHat-based detected"
        sudo yum install -y python3 python3-venv python3-pip jq
    else
        echo "⚠️ Distribuição Linux não suportada automaticamente."
        exit 1
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "🍎 MacOS detected"
    brew install python jq
elif [[ "$OSTYPE" == "msys"* ]]; then
    echo "🪟 Windows (WSL/Git Bash) detected"
    sudo apt update
    sudo apt install -y python3 python3-venv python3-pip jq
else
    echo "🚫 Sistema operacional não suportado."
    exit 1
fi

echo "✅ Python instalado ou já existente."

# Executar setup_shell.sh
bash setup_shell.sh
