#!/bin/bash

read -s -p "Nome secreto: " NAME_secret
echo

for (( ; ; )); do
    read -p "Adivinha o nome: " guess
    if [ "$guess" == "$NAME_secret" ]; then
        echo "acertaste a palavra: $NAME_secret"
        break
    else
        clear
        echo "Errado."
    fi
done
