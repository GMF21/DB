#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <acao>"
  exit 1
fi

acao=$1

while true; do
  case $acao in 
    criar)
      read -rp "Digite o nome do arquivo: " file
      touch "$file"
      echo "Ficheiro '$file' criado."
      ;;
    escrever)
      read -rp "Escreve no teu ficheiro: " texto
      echo "$texto" > "$file"
      echo "Texto escrito em '$file'."
      ;;
    ler) 
      if [ -f "$file" ]; then
        echo "Conteúdo de '$file':"
        cat "$file"
      else
        echo "Ficheiro '$file' não existe."
      fi
      ;;
    contar)
      if [ -f "$file" ]; then
        echo "O ficheiro '$file' tem $(wc -w < "$file") palavra(s)."
      else
        echo "Ficheiro '$file' não existe."
      fi
      ;;
    sair)
      echo "A sair..."
      break
      ;;
    *)
      echo "Ação inválida. Usa: criar, escrever, ler, contar, sair"
      ;;
  esac
  
  read -rp "Escolhe uma nova ação (criar/escrever/ler/contar/sair): " acao
done
