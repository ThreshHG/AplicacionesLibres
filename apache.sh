#!/bin/bash
sudo apt install git -y
sudo git clone https://github.com/ThreshHG/AplicacionesLibres.git
ip=`hostname -I |awk '{print $1}'`
apache=`which apache2`
o=`echo $?`
<<<<<<< HEAD

=======
sudo apt install php -y
>>>>>>> 6edb747fe9b3cdbf520707e38fe636cb83ec300f
if [ $o != 0  ]
then
sudo apt update && apt upgrade -y
sudo apt install apache2 -y
else 
echo -e "Apache2 esta Instalado" 

fi

sudo systemctl restart apache2
 
sudo apt install php -y
#php -S $ip:8080
user=`whoami`
<<<<<<< HEAD
sudo rm /var/www/html/index.html
=======

sudo rm /var/www/html/index.html

>>>>>>> 6edb747fe9b3cdbf520707e38fe636cb83ec300f
sudo mkdir -p /var/www/html/mis_archivos

sudo ln -s /var/www/html/mis_archivos  /home/$user/Escritorio

sudo cp index.php curza.png /var/www/html
<<<<<<< HEAD
sudo chmod  -R +777 /var/www/*
=======

cd /var/www/html/mis_archivos
sudo touch  prueba.txt /var/www/html/mis_archivos
sudo mkdir prueba_dir
sudo chmod  -R +777 /var/www/html/*
>>>>>>> 6edb747fe9b3cdbf520707e38fe636cb83ec300f
echo -e  "pueden acceder desde una navegador web con esta ip $ip:80"
