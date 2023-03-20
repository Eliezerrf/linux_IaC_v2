#!/bin/bash

echo "Atualizando o Sistema Operacional"
apt-get update -y 
apt-get upgrade -y  --show-progress

if [ ! -d "/var/www/html" ]       ## Verificando se o apache já está instalado         
then
    echo "Instalado o Apache e Unzip no Servidor"
    apt-get install apache2 -y
    apt-get install unzip -y
else
    echo "Apache já instalado..."
fi

echo "Atulizando a aplicação HTML..."
if [ ! -d "/tmp" ]
then
    mkdir /tmp
fi

cd /tmp
echo "Realizando o donwload da aplicação HTML..."
if [ -f "/tmp/main.zip" ]
then 
   rm /tmp/main.zip
fi

wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

if [ -f "/tmp/main.zip" ] 
then
   echo "Descompactando a aplicação HTML..." 
   unzip -o main.zip
   cd linux-site-dio-main
   echo "Copiando a aplicação HTML..."
   cp -R * /var/www/html/
else
   echo "Não foi possível realizar o donwload da aplicação HTML..."
fi
