#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Uso: $0 <texto>"
  exit 1
fi

texto="ola mundo"
file="texto.txt"

echo "$texto" > $file
