# 🧠 Comandos Básicos do Linux

Este documento contém os comandos essenciais para qualquer usuário Linux. São comandos que você usará diariamente, seja para navegar no sistema, gerenciar arquivos ou realizar tarefas administrativas.

---

## 📁 1. `ls` — Listar arquivos e diretórios

Lista os arquivos e pastas do diretório atual.

```bash
ls           
ls -l        # lista com detalhes
ls -a        # inclui arquivos ocultos
ls -lh       # mostra os tamanhos em formato legível

-------------------------------------------------------------------------------------------------
## 📂 2. cd — Navegar entre diretórios

cd /home/usuario      # vai para a pasta do usuário
cd ..                 # volta um diretório
cd                    # vai para o diretório pessoal

-------------------------------------------------------------------------------------------------
## 🧭 3. pwd — Mostrar o caminho atual

pwd  # Exibe o caminho completo do diretório em que você está.

-------------------------------------------------------------------------------------------------
## 📦 4. mkdir — Criar diretórios

mkdir                          # nova-pasta
mkdir -p pasta1/pasta2/pasta3  # cria estrutura completa, Cria uma ou mais pastas novas.

-------------------------------------------------------------------------------------------------
## 🧹 5. rm — Remover arquivos ou diretórios

rm arquivo.txt               # remove arquivo
rm -r pasta                  # remove pasta recursivamente
rm -rf pasta                 # força remoção (perigoso!)

-------------------------------------------------------------------------------------------------
## 📋 6. cp — Copiar arquivos ou diretórios

cp arquivo.txt backup.txt
cp -r pasta1 pasta2         # copia diretório com conteúdo

-------------------------------------------------------------------------------------------------
## ✂️ 7. mv — Mover ou renomear arquivos

mv arquivo.txt /tmp/
mv velho.txt novo.txt       # renomeia

-------------------------------------------------------------------------------------------------
## 📄 8. cat — Exibir conteúdo de arquivos

cat arquivo.txt             # Mostra o conteúdo de um arquivo no terminal.

-------------------------------------------------------------------------------------------------
## 🔍 9. echo — Imprimir uma linha de texto

echo "Olá mundo"
echo "teste" > arquivo.txt  # cria um arquivo com esse conteúdo

-------------------------------------------------------------------------------------------------
## 🔧 10. touch — Criar arquivos vazios

touch novo-arquivo.txt      # Cria um novo arquivo em branco.

-------------------------------------------------------------------------------------------------
## 🛠️ 11. chmod — Alterar permissões

chmod                       # Controla quem pode ler, escrever ou executar arquivos.
chmod +x script.sh          # dá permissão de execução
chmod 755 arquivo.sh        # modo octal

-------------------------------------------------------------------------------------------------
## 👤 12. whoami — Ver o usuário atual

whoami                      # Mostra qual usuário está logado no terminal.

-------------------------------------------------------------------------------------------------
## 📚 13. man — Ajudas e manuais

man ls                      # Consulta o manual de qualquer comando.
man mkdir

-------------------------------------------------------------------------------------------------
## 🧼 14. clear — Limpar o terminal

clear                       # Apaga o conteúdo da tela do terminal. 

-------------------------------------------------------------------------------------------------
## 🧮 15. df e du — Espaço em disco

df -h                       # espaço usado por partições
du -sh pasta                # tamanho da pasta

-------------------------------------------------------------------------------------------------

⚠️ Dica: Use sempre man comando para aprender mais sobre qualquer comando do Linux.

Feito por Amilcar Junior 💻
