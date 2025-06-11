#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Uso: $0 <container> <nome_da_db> <nome_da_tabela>"
    exit 1
fi

container="$1"
nome_DB="$2"
nome_Tabela="$3"
sql_file="criar_tabela.sql"


echo "CREATE DATABASE IF NOT EXISTS $nome_DB" > criar_tabela.sql;
echo "USE $nome_DB" >> criar_tabela.sql;
echo "CREATE TABLE IF NOT EXISTS $nome_Tabela" (
    Nome VARCHAR(255)
); >> criar_tabela.sql

read -p "Username: " user
read -s -p "Password: " pass

docker exec -i "$container" mysql -u"$user" -p"$pass" < "$sql_file"
