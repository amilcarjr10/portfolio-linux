#!/bin/bash

echo "🔄 Backup dos arquivos originais do BIND..."
sudo cp /etc/bind/named.conf /etc/bind/named.conf.bak
sudo cp /etc/bind/named.conf.options /etc/bind/named.conf.options.bak
sudo cp /etc/bind/named.conf.local /etc/bind/named.conf.local.bak

echo "📂 Copiando arquivos de configuração..."
sudo cp conf/named.conf /etc/bind/named.conf
sudo cp conf/named.conf.options /etc/bind/named.conf.options
sudo cp conf/named.conf.local /etc/bind/named.conf.local
sudo cp conf/db.meudominio.local /etc/bind/db.meudominio.local
sudo cp conf/db.192.rev /etc/bind/db.192.rev

echo "🔎 Verificando arquivos de configuração..."
sudo named-checkconf
sudo named-checkzone meudominio.local /etc/bind/db.meudominio.local
sudo named-checkzone 1.168.192.in-addr.arpa /etc/bind/db.192.rev

echo "♻️ Reiniciando o serviço do BIND9..."
sudo systemctl restart bind9

echo "📡 Status do serviço:"
sudo systemctl status bind9 --no-pager
