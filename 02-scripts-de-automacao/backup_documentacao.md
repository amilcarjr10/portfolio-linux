Documentação do Script de Backup
Este script realiza o backup automático dos arquivos de um diretório específico, compactando-os e armazenando-os em uma pasta de destino, além de enviar uma notificação por e-mail sobre o sucesso do processo.

O que o script faz?
Criação de Backup: O script cria um backup dos arquivos de um diretório especificado. Ele utiliza a ferramenta tar para compactar os arquivos em um arquivo .tar.gz, o que garante que o backup ocupe menos espaço e seja mais fácil de transferir.

Destinos de Backup: O backup é armazenado em um diretório configurado pelo usuário, como por exemplo, /home/usuario/backups, ou qualquer outro caminho que o usuário definir na variável $DIR_DESTINO.

Notificação por E-mail: Após a conclusão do backup, o script envia um e-mail de notificação, utilizando o programa msmtp (ou outro serviço configurado), informando que o backup foi realizado com sucesso, incluindo a data e a hora da execução.

Passo a Passo do Script
1. Definição de Variáveis:
No início do script, são definidas algumas variáveis importantes:

DIR_ORIGEM: O diretório de origem dos arquivos a serem copiados.

DIR_DESTINO: O diretório onde o backup será armazenado.

EMAIL: O e-mail que receberá a notificação após a conclusão do backup.

2. Criação do Backup:
O comando principal para criação do backup é:

" 
tar -czf $DIR_DESTINO/backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz $DIR_ORIGEM "

Aqui está a explicação detalhada dos parâmetros usados:

-c: Cria um novo arquivo. Este parâmetro indica ao tar para criar um novo arquivo de backup.

-z: Compacta o arquivo usando o gzip. O gzip comprime os dados, reduzindo o tamanho do arquivo de backup.

-f: Especifica o nome do arquivo de destino. O nome do arquivo gerado será o nome do diretório de backup seguido pela data e hora atual.
 Isso garante que cada backup tenha um nome único e não sobreponha os anteriores.

Exemplo de arquivo gerado: backup_2025-04-22_14-30-00.tar.gz

$DIR_DESTINO/backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz: 
O caminho onde o arquivo de backup será salvo.
 Ele é combinado com a data e hora geradas pelo comando date, criando um nome único para cada arquivo.

$DIR_ORIGEM: O diretório de origem dos arquivos a serem copiados. O conteúdo deste diretório será compactado no arquivo de backup.

3. Notificação por E-mail:
Após a criação do backup, o script envia uma notificação por e-mail para informar o sucesso do processo. A linha do script para enviar o e-mail é:

echo "Backup realizado com sucesso em $(date)" | msmtp $EMAIL

Aqui está a explicação de cada parte dessa linha:

$(date): Exibe a data e a hora em que o backup foi realizado. Isso ajuda o destinatário a saber exatamente quando o backup foi feito.

msmtp: Comando usado para enviar o e-mail. Ele é configurado para utilizar um servidor SMTP para enviar o e-mail. 
O msmtp pode ser configurado com vários servidores de e-mail, como Gmail ou outros.

$EMAIL: O endereço de e-mail para o qual a notificação será enviada. O endereço de e-mail é configurado na variável $EMAIL no início do script.

Conclusão
O script de backup descrito acima automatiza o processo de criação de backups regulares de um diretório, 
tornando-o mais fácil de gerenciar e mais seguro, já que mantém cópias comprimidas dos dados em uma pasta de destino. 
Além disso, a notificação por e-mail garante que o usuário seja informado sobre o sucesso de cada execução do backup.
