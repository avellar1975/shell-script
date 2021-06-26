#!/bin/bash

converter_imagem(){
local caminho_imagem=$1
local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. '{ print $1 }')
convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
}

varrer(){
cd $1
for arquivo in *
do
	local caminho=$(find $1 -name $arquivo)
	if [ -d $caminho ]
	then
		varrer $caminho
	else
		converter_imagem $caminho
	fi
done
}

varrer ~/Codigos/shell-script/imagens-novos-livros

if [ $? -eq 0 ]
then
    echo "Conversão realizada com sucesso"
else
    echo "Houve uma falha no processo de conversão"
fi
