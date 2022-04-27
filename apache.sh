#!/bin/bash
apt install git -y
git clone https://github.com/ThreshHG/AplicacionesLibres.git
ip=`hostname -I |awk '{print $1}'`
apache=`which apache2`
o=`echo $?`
apt install php
if [ $o != 0  ]
then
apt update && apt upgrade -y

else 
echo -e "Apache2 esta Instalado" 

fi

systemctl start apache2

php -S $ip:8080

echo -e  "pueden acceder desde una navegador web con esta ip $ip:8080"
