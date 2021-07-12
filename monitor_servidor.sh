#!/usr/bin/env bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null localhost)

if [ $resposta_http -ne 200 ]
then
mail -s "Problema no servidor apache" evandro.avellar@gmail.com<<del
Houve um problema no servidor apache e os usuários estão sem acesso.
del
  	systemctl restart apache2

fi
