#!/bin/bash

if [ $# -ne 2 ] && [ "$1" != "criar" ]; then
  echo "Uso: $0 <acao> <container>"
  exit 1
fi

acao=$1
container=$2
imagem=$3

if [ $1 == "criar" ] && [ $# -ne 3 ]; then
    echo "tens de especificar a imagem"
    exit 1  
fi
    

case $acao in  #swicth case para escolher o que quero fazer
    criar)
        docker run -d --name "$container" "$imagem"
    ;;

    iniciar)
        docker start "$container"
    ;;

    parar)
        docker stop "$container"
    ;;

    apagar)
        docker rm "$container"
    ;;

    estado)
        docker ps -a | grep "$container"
    ;;

esac
