import json
import os
import subprocess
import multiprocessing
import psutil  # Precisa ser instalado (pip install psutil)

# Ler config.json
with open('config.json', 'r') as file:
    config = json.load(file)

libs = config["libs"]
parallel = config.get("parallel_install", True)
optimize_memory = config.get("optimize_memory", True)

def install_package(pkg):
    try:
        subprocess.run(["pip", "install", pkg], check=True)
        print(f"✅ Installed {pkg}")
    except subprocess.CalledProcessError:
        print(f"❌ Failed to install {pkg}")

def memory_check():
    mem = psutil.virtual_memory()
    print(f"🧠 RAM Total: {round(mem.total / (1024 ** 3), 2)} GB")
    if mem.available < (mem.total * 0.2):
        print("⚠️ Baixa memória disponível. A instalação pode ser mais lenta.")

def main():
    print("🚀 Iniciando instalação de pacotes...")

    if optimize_memory:
        memory_check()

    if parallel:
        with multiprocessing.Pool(processes=os.cpu_count()) as pool:
            pool.map(install_package, libs)
    else:
        for lib in libs:
            install_package(lib)

    print("🎯 Instalação concluída com sucesso.")

if __name__ == "__main__":
    try:
        import psutil
    except ImportError:
        print("🔧 Instalando dependência: psutil")
        subprocess.run(["pip", "install", "psutil"], check=True)
        import psutil

    main()
