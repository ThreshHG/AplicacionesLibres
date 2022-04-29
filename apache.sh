#!/bin/bash
sudo apt install git -y
sudo git clone https://github.com/ThreshHG/AplicacionesLibres.git
ip=`hostname -I |awk '{print $1}'`
apache=`which apache2`
o=`echo $?`

if [ $o != 0  ]
then
sudo apt update && apt upgrade -y

else 
echo -e "Apache2 esta Instalado" 

fi

sudo systemctl restart apache2
 
sudo apt install php -y
#php -S $ip:8080
user=`whoami`
sudo rm /var/www/html/index.html
sudo mkdir -p /var/www/html/mis_archivos
sudo ln -s /var/www/html/mis_archivos  /home/$user/Escritorio
sudo cp index.php curza.png /var/www/html
sudo chmod  -R +777 /var/www/*
echo -e  "pueden acceder desde una navegador web con esta ip $ip:80"
