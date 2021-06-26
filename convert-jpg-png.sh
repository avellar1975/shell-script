#!/bin/bash

converte(){
CAMINHO_IMAGENS=~/Codigos/shell-script/imagens-livros/

cd $CAMINHO_IMAGENS
if [ ! -d png ]
then
	mkdir png
fi

for imagem in *.jpg
do 
	local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
	convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
}

converte 2>erros_conversao.log

if [ $? -eq 0 ]
then
	echo "Conversao realizada com sucesso"
else
	echo "Houve uma falha no processo"
fi
