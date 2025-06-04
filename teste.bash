#!/bin/bash

# Lê o nome secreto sem mostrar no terminal
read -s -p "Nome secreto: " NAME_secret
echo ""

# Ciclo infinito com for (sem limite de tentativas)
for (( ; ; )); do
    read -p "Adivinha o nome: " guess

    if [[ "$guess" == "$NAME_secret" ]]; then
        echo "Acertaste! O nome é mesmo $NAME_secret."
        break
    else
        echo "Errado. Tenta outra vez."
    fi
done
