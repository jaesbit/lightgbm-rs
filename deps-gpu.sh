#!/bin/bash
# Instalar las herramientas y bibliotecas necesarias para trabajar con OpenCL y Boost en Ubuntu

# Detectar el tipo de GPU
gpu_type=$(lspci | grep -E "NVIDIA|AMD|Intel" | cut -d ':' -f3)

# Instalar paquetes basados en el tipo de GPU
if echo "$gpu_type" | grep -iq "NVIDIA"; then
    echo "NVIDIA GPU detectada. Instalando paquetes para NVIDIA..."
    sudo apt-get install -y nvidia-opencl-dev nvidia-cuda-dev nvidia-cuda-toolkit
elif echo "$gpu_type" | grep -iq "AMD"; then
    echo "AMD GPU detectada. Instalando paquetes para AMD..."
    sudo apt-get install -y clinfo-amdgpu-pro
elif echo "$gpu_type" | grep -iq "Intel"; then
    echo "Intel GPU detectada. Instalando paquetes para Intel..."
    sudo apt-get install -y beignet
else
    echo "No se pudo detectar el tipo de GPU. Instalación abortada."
fi


# Para instalar Boost y sus módulos específicos (filesystem y system)
sudo apt-get install -y libboost-all-dev libboost-filesystem-dev libboost-system-dev

# Herramientas adicionales que pueden ser necesarias
sudo apt-get install -y cmake build-essential

# Para verificar la versión de Boost (opcional)
dpkg -s libboost-dev | grep 'Version'
