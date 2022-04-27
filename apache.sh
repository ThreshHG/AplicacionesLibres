#!/bin/bash

apache=`which apache2`
o=`echo $?`

if [ $o != 0  ]
then
apt update && apt upgrade -y
apt install apache2 -y
echo $disro 
else 
echo -e "Apache2 esta Instalado" 

fi
rm  /var/www/html/*
unzip AplicacionesLibres.zip 
sudo cp  AplicacionesLibres/* /var/www/html/
