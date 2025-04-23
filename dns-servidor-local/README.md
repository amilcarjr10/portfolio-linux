# 🖥️ Servidor DNS com BIND9 no Linux – Configuração Manual e Automação

## 📌 Objetivo

Este projeto demonstra a configuração de um **servidor DNS autoritativo usando o BIND9**, abordando práticas reais utilizadas em ambientes corporativos.
 A estrutura contempla arquivos de configuração, zonas direta e reversa, automação via shell script e validações com ferramentas nativas.
 Ideal para mostrar domínio técnico na área de infraestrutura, redes e sistemas Linux.

---

## ⚙️ Tecnologias e Ferramentas Utilizadas

- 🔧 BIND9
- 🐧 Kali Linux / Debian
- 📁 Arquivos: `named.conf`, `named.conf.local`, `named.conf.options`, arquivos de zona
- 📝 Shell Script (`bash`)
- 🛠️ named-checkconf / named-checkzone
- 🔄 systemctl

---

## 📁 Estrutura do Projeto

meu-projeto-dns/
 ├── conf/
    ├── named.conf │
    ├── named.conf.options │ 
    ├── named.conf.local │ 
    ├── db.meudominio.local │ 
    └── db.192.rev 
├── scripts/ 
             └── setup.sh 
└── README.md
---------------------------------------------------------------------------------------------------------------------------------------------------------


---

## 🧠 O que esse projeto cobre?

- Configuração manual e automatizada do BIND9
- Criação de arquivos de zona direta (`meudominio.local`)
- Criação de zona reversa (`192.168.1.0/24`)
- Testes com `dig` e análise de resposta
- Verificações e validações de sintaxe
- Execução do serviço DNS como `bind9.service`

---

## 🚀 Como executar

1. Clone o repositório:

```bash
git clone https://github.com/amilcarjr10/meu-projeto-dns.git
cd meu-projeto-dns 
```
2. Dê permissão ao script:

chmod +x scripts/setup.sh

3. Execute o script:
 
sudo ./scripts/setup.sh

4. Teste com:

dig @127.0.0.1 meudominio.local

---------------------------------------------------------------------------------------------------------------------------------------------------------

# Testes realizados:

Verificação de sintaxe com named-checkconf

Verificação de zonas com named-checkzone

Status ativo com systemctl status bind9

Respostas de resolução DNS com dig

---------------------------------------------------------------------------------------------------------------------------------------------------------

#⚠️ Observações Importantes

O domínio .local é reservado para Multicast DNS (mDNS), mas está sendo usado aqui com fins didáticos.

O servidor está configurado para escutar em 127.0.0.1, ideal para testes locais.

Para ambiente de produção, altere as interfaces no named.conf.options.

---------------------------------------------------------------------------------------------------------------------------------------------------------

👨‍💻 Autor
Amilcar Junior
📧 amilcarjr10@hotmail.com
🔗 LinkedIn - https://www.linkedin.com/in/amilcarjr10/ 
