#!/usr/bin/env bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null localhost)

echo $resposta_http
