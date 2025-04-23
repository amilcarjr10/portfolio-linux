#!/bin/bash

# ========== CONFIGURAÇÕES ==========
CPU_LIMIT=80       # Limite de uso da CPU (%)
MEM_LIMIT=80       # Limite de uso da Memória RAM (%)
DISK_LIMIT=90      # Limite de uso do Disco (%)
EMAIL="seuemail@dominio.com"  # Altere para seu e-mail (se quiser alertas)

# ========== MONITORAMENTO ==========

# CPU
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
# Memória
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
# Disco (/)
DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

# ========== SAÍDA ==========
echo "-------------------------"
echo "📊 Monitoramento do Sistema"
echo "Data/Hora: $(date)"
echo "CPU: $CPU_USAGE %"
echo "Memória: $MEM_USAGE %"
echo "Disco: $DISK_USAGE %"
echo "-------------------------"

# ========== ALERTAS ==========
if (( $(echo "$CPU_USAGE > $CPU_LIMIT" | bc -l) )); then
    MSG="⚠️ ALERTA: CPU em $CPU_USAGE% (limite: $CPU_LIMIT%)"
    echo "$MSG"
    # echo "$MSG" | mail -s "Alerta de CPU" "$EMAIL"
fi

if (( $(echo "$MEM_USAGE > $MEM_LIMIT" | bc -l) )); then
    MSG="⚠️ ALERTA: Memória em $MEM_USAGE% (limite: $MEM_LIMIT%)"
    echo "$MSG"
    # echo "$MSG" | mail -s "Alerta de Memória" "$EMAIL"
fi

if [ "$DISK_USAGE" -gt "$DISK_LIMIT" ]; then
    MSG="⚠️ ALERTA: Disco em $DISK_USAGE% (limite: $DISK_LIMIT%)"
    echo "$MSG"
    # echo "$MSG" | mail -s "Alerta de Disco" "$EMAIL"
fi
