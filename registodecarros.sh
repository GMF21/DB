#!/bin/bash

if [ $# -ne 4 ]; then
  echo "Uso: $0 <user> <pass> <container> <file>"
  exit 1
fi

user="$1"
pass="$2"
container="$3"
file="criar_base_carros.sql"

echo "CREATE DATABASE IF NOT EXISTS stand_automovel;" > "$file"
echo "USE stand_automovel;" >> "$file"
echo "CREATE TABLE IF NOT EXISTS carros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT,
    preco DECIMAL(10, 2)
);" >> "$file" 

echo "INSERT INTO carros (marca, modelo, ano, preco)
VALUES ('Toyota', 'Corolla', 2020, 18500.00);" >> "$file"

docker exec -i "$container" mysql -u"$user" -p"$pass" < "$file"
