#!/bin/bash

# filtro.sh - filtro para arquivo de log do apache

# Recebe os parâmetros GET, POST, PUT ou DELETE

# Devolve as linhas do log que possuem os verbos do parâmetros

# $ bash filtro.sh GET

if [ -z $1 ]
then
  while [[ -z $requisicao ]]; do
    read -p 'Você esqueceu de informar o parametro (GET, PUT, POST, DELETE): '\
    requisicao
    maiuscula=$(echo $requisicao | awk '{ print toupper($1)}')
  done
else
  maiuscula=$(echo $1 | awk '{ print toupper($1)}')
fi

cd ./log

case $maiuscula in
  GET)
  cat access.log | grep GET
  ;;

  POST)
  cat access.log | grep POST
  ;;

  PUT)
  cat access.log | grep PUT
  ;;

  DELETE)
  cat access.log | grep DELETE
  ;;

  *)
  echo "O parâmetro passado não é válido"
  ;;
esac
