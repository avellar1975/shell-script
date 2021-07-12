#!/usr/bin/env bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')

percentual=$(bc <<< "scale=2;$memoria_consumida/$memoria_total * 100" | awk -F. '{ print $1 }')

if [ $percentual -gt 10 ]
then
mail -s "Consumo de Memória acima do limite" evandro.avellar@gmail.com<<del
O consumo de memória está acima do limite especificado. Atualmente o consumo é de
$(free -h | grep -i mem | awk '{ print $3 }').
del
fi
