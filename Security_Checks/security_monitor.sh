#!/bin/bash

# --- CABECALHO DO RELATORIO ---
echo "=========================================================="
echo " RELATORIO DE MONITORAMENTO DE SEGURANCA | $(date)"
echo "=========================================================="
echo " "


# --- 1. VERIFICACAO DE FALHAS DE LOGIN (POTENCIAL BRUTE FORCE) ---
echo "--- 1. BUSCA POR FALHAS DE LOGIN SSH RECENTES (Ultimas 10) ---"
# O grep busca 'Failed password' no log de autenticacao e o tail limita a 10 entradas.
grep "Failed password" /var/log/auth.log | tail -n 10
echo " "


# --- 2. VERIFICACAO DE ULTIMO LOGIN DO SUPERUSUARIO (ROOT) ---
echo "--- 2. ULTIMO LOGIN DE ROOT ---"
# O comando last mostra o historico de login, e filtramos para ver apenas o root.
last root | head -n 2
echo " "


# --- 3. VERIFICACAO DE VULNERABILIDADE DO KERNEL (HARDENING) ---
echo "--- 3. VERSAO DO KERNEL (Verificar por vulnerabilidades conhecidas) ---"
# O uname -a exibe o nome do kernel, hostname, versao, etc.
uname -a
echo " "
echo "=========================================================="
# --- CABECALHO DA FASE III ---
echo " "
echo "=========================================================="
echo " RELATORIO DE DIAGNOSTICO DE REDE E FIREWALL"
echo "=========================================================="


# --- 4. VERIFICACAO DE PORTAS EM ESCUTA (SUBSTITUTO MODERNO DO NETSTAT) ---
echo "--- 4. PORTAS TCP/UDP EM ESCUTA (ss -tuln) ---"
# O comando ss lista conexoes ativas. O -t (tcp), -u (udp), -l (listening), -n (numeric).
ss -tuln
echo " "


# --- 5. VERIFICACAO DO STATUS DO FIREWALL LOCAL (HARDENING) ---
echo "--- 5. STATUS DO FIREWALL UFW (Se estiver instalado) ---"
# O firewall local deve estar ativo para evitar acessos indesejados.
# Usamos 'ufw status' (comum em Ubuntu/Kali)
sudo ufw status | head -n 3
echo " "


# --- 6. VERIFICACAO DE RESOLUCAO DE NOMES (DNS) ---
echo "--- 6. SERVIDORES DNS PRIMARIOS (/etc/resolv.conf) ---"
# Se o DNS falhar, a comunicacao falha.
cat /etc/resolv.conf
echo " "


# --- FIM DO SCRIPT ---
echo "=========================================================="
echo " FIM DO CHECK DE SEGURANCA | EXECUCAO CONCLUIDA"
echo "=========================================================="
