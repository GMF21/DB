#!/bin/bash

if [ $# -ne 4 ]; then
  echo "Uso: $0 <user_ROOT> <pass_ROOT> <NOVO_USER> <NOVA_PASS>"
  exit 1
fi

user_ROOT="$1"
pass_ROOT="$2"
NOVO_USER="$3"
NOVA_PASS="$4"

sqlFile="create_user.sql"

#ficheiro
echo "-- Criar utilizador $NOVO_USER no MySQL" > "$sqlFile"
echo "CREATE USER IF NOT EXIST'$NOVO_USER'@'localhost' IDENTIFIED BY '$NOVA_PASS';" >> "$sqlFile"
echo "GRANT ALL PRIVILEGES ON *.* TO '$NOVO_USER'@'localhost' WITH GRANT OPTION;" >> "$sqlFile"

mysql -u "$user_ROOT" -p"$pass_ROOT" < "$sqlFile"
