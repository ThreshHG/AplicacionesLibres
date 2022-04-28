#!/bin/bash
sudo apt install git -y
sudo git clone https://github.com/ThreshHG/AplicacionesLibres.git
ip=`hostname -I |awk '{print $1}'`
apache=`which apache2`
o=`echo $?`
sudo apt install php -y
if [ $o != 0  ]
then
sudo apt update && apt upgrade -y
sudo apt install apache2 -y
else 
echo -e "Apache2 esta Instalado" 

fi

sudo systemctl restart apache2
 
#php -S $ip:8080
user=`whoami`

sudo rm /var/www/html/index.html

sudo mkdir -p /var/www/html/mis_archivos

sudo ln -s /var/www/html/mis_archivos  /home/$user/Escritorio

sudo cp index.php curza.png /var/www/html

cd /var/www/html/mis_archivos
sudo touch  prueba.txt /var/www/html/mis_archivos
sudo mkdir prueba_dir
sudo chmod  -R +777 /var/www/html/*
echo -e  "pueden acceder desde una navegador web con esta ip $ip:80"
