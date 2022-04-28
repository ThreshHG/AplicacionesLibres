sudo git clone https://github.com/ThreshHG/AplicacionesLibres.git#!/bin/bash
sudo apt install git -y
sudo git clone https://github.com/ThreshHG/AplicacionesLibres.git
ip=`hostname -I |awk '{print $1}'`
apache=`which apache2`
o=`echo $?`
sudo apt install php
if [ $o != 0  ]
then
sudo apt update && apt upgrade -y

else 
echo -e "Apache2 esta Instalado" 

fi

sudo systemctl restart apache2
 
#php -S $ip:8080
user=`whoami`
sudo mkdir -p /var/www/html/mis_archivos
sudo ln -s /var/www/html/mis_archivos  /home/$user/Escritorio
sudo cp index.php curza.png /var/www/html
sudo chmod  -R +777 /var/www/html/*
echo -e  "pueden acceder desde una navegador web con esta ip $ip:8080"
