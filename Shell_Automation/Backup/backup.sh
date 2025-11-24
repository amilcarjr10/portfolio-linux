#!/bin/bash

# Configurações iniciais
ORIGEM="/home/kali/Documents"              # Diretório de origem
DESTINO="/home/kali/backup"                # Diretório de destino
LOG_FILE="/home/kali/backup/backup.log"    # Caminho para o arquivo de log
EMAIL="amilcarjr10@hotmail.com"               # E-mail para notificações

# Função para enviar e-mail de notificação
enviar_email() {
    local assunto=$1
    local mensagem=$2
    echo "$mensagem" | mail -s "$assunto" $EMAIL
}

# Função para verificar espaço em disco
verificar_espaco() {
    local espaco_disponivel=$(df -h $DESTINO | tail -1 | awk '{print $4}' | sed 's/[A-Za-z]//g')
    local espaco_necessario=$(du -sh $ORIGEM | awk '{print $1}' | sed 's/[A-Za-z]//g')
    
    if [ $espaco_disponivel -lt $espaco_necessario ]; then
        echo "Espaço insuficiente no disco para o backup!" >> $LOG_FILE
        enviar_email "Erro no Backup: Espaço Insuficiente" "O backup não pôde ser realizado devido a espaço insuficiente no disco."
        exit 1
    fi
}

# Função para realizar o backup incremental
backup_incremental() {
    local data_atual=$(date +%Y-%m-%d_%H-%M-%S)
    local destino_backup="$DESTINO/backup_$data_atual"

    mkdir -p $destino_backup
    rsync -av --link-dest=$DESTINO/backup_$(date +%Y-%m-%d --date='1 day ago') $ORIGEM/ $destino_backup/

    if [ $? -eq 0 ]; then
        echo "Backup incremental concluído com sucesso em $data_atual" >> $LOG_FILE
    else
        echo "Erro durante o backup incremental em $data_atual" >> $LOG_FILE
        enviar_email "Erro no Backup Incremental" "O backup incremental falhou em $data_atual."
        exit 1
    fi
}

# Função para compactar o backup
compactar_backup() {
    local backup_dir=$1
    local arquivo_backup="$DESTINO/backup_$data_atual.tar.gz"

    tar -czf $arquivo_backup -C $backup_dir .

    if [ $? -eq 0 ]; then
        echo "Backup compactado com sucesso em $arquivo_backup" >> $LOG_FILE
    else
        echo "Erro ao compactar o backup" >> $LOG_FILE
        enviar_email "Erro na Compactação do Backup" "A compactação do backup falhou."
        exit 1
    fi
}

# Função principal de execução do script
realizar_backup() {
    echo "Iniciando o processo de backup em $(date)" >> $LOG_FILE

    # Verificar espaço em disco antes de iniciar
    verificar_espaco

    # Realizar backup incremental
    backup_incremental

    # Compactar o backup
    compactar_backup "$DESTINO/backup_$data_atual"

    # Notificação de sucesso
    enviar_email "Backup Completo" "O backup foi concluído com sucesso em $data_atual."

    echo "Backup concluído com sucesso em $(date)" >> $LOG_FILE
}

# Iniciar o processo de backup
realizar_backup

