#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

file="text.txt"

read -r -p "Escreve o texto que queres contar os caracteres: " texto
echo "$texto" > "$file"

for ficheiro in $file; do
    echo "O ficheiro $ficheiro tem $(wc -m < "$ficheiro") caracteres."
    echo "O ficheiro $ficheiro tem $(wc -w < "$ficheiro") palavras."
    echo "O ficheiro $ficheiro tem $(wc -l < "$ficheiro") linhas."
done
