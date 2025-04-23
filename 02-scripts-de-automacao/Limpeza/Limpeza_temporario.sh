#!/bin/bash

# Script para limpar arquivos temporários

# Limpar a pasta /tmp
echo "Limpando /tmp..."
sudo rm -rf /tmp/*

# Limpar a lixeira
echo "Limpando lixeira..."
rm -rf ~/.local/share/Trash/*

# Mensagem de conclusão
echo "Limpeza concluída!"
