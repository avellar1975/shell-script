#!/bash/bin

cd ./logs

regex "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]
then
        cat access.log | grep $1
else
        echo "Formato não é válido"
fi
