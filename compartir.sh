#!/bin/bash
#
# Aplicaciones Libres
#
##################################################################
# Debian o Derivadas
nmcli_debian(){
        #actualizamos
        sudo apt update  
        sudo apt upgrade -y
        #Instalamos curl para poder instalar NVM
        sudo apt install curl
        #Revisión de secuencia de comandos 
        if [ -f install_nvm.sh ] 
	then
	echo "ya esta instalado"
	else
	curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh -o install_nvm.sh
        #revisar solo funciona en rootcurl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
        sudo bash install_nvm.sh
        
	 #Obtenemos secuencia de comandos 
        source ~/.bashrc
        ##Instalamos la versión deseada 
        nvm install v16.15.0
        npm install -g serve
        sleep 2
        fi
	user=`who |awk '/tty/{print $1}'`
        sudo mkdir -p /home/$user/compartir 2> /dev/null
	ln -s /home/$user/compartir /home/$user/Escritorio
	##uicar placa wifi interface ejemplo wlan0
	#paso 2
	o=`nmcli d |awk '/w/{print $1}'|xargs |awk '{print $1}'`
	IFNAME="$o"
	CON_NAME="$user"
	#nmcli con add type wifi ifname $IFNAME con-name $CON_NAME autoconnect yes ssid $CON_NAME
	nmcli con add type wifi ifname $IFNAME con-name $CON_NAME  ssid $CON_NAME
	##paso 3
	##asignar ipv4 a la coneecion agregada anteriormente 
	nmcli con modify $CON_NAME 802-11-wireless.mode ap 802-11-wireless.band bg ipv4.method shared
	##paso 4
	read -p "elije una contraseña" contrasenia
	nmcli con modify $CON_NAME wifi-sec.key-mgmt wpa-psk
	nmcli con modify $CON_NAME wifi-sec.psk $contrasenia
	sudo apt install imagemagick-6.q16 2> /dev/null
	sudo apt install qrencode 2> /dev/null
	nmcli con up $CON_NAME
	sleep 3
        serve -p 1234 /home/$user/compartir &

	#nmcli connection show $CON_NAME

	##borrar conecion antes de terminar
	echo "LA CONTRASEÑA ES $contrasenia"
	qrencode -o contrase.png -s 9  $contrasenia
	display contrase.png &
	read -p "ya esta el punto de acceso conectado para cerrar  precione una tecla " l

	nmcli con delete `nmcli c |awk '/'$u'/{print $2}'`

	nmcli networking off
	nmcli networking on
	rm contrase.png

}

# Función para guía del usuario 
ayuda_debian(){
	echo -e ""
	echo -e "--------------------------------------------------------------------------------------"
    echo -e "El siguiente Script se utiliza para compartir directorio ya sea como red desde la pc o"
    echo -e "desde la red wi-fi"
	echo -e "--------------------------------------------------------------------------------------"
	echo -e "Si selecciona la opción 1: Utiliza la máquina como router y comparte directorio Debian o derivadas (Ej: Huayra)"
	echo -e "Si selecciona la opción 2: Ayuda (opción actual)"
	echo -e "Si selecciona la opción 3: Sale del programa"
    echo -e ""
}

##################################################################
# Ubuntu o Derivadas
# Función correr Nmcli y Serve
nmcli_ubuntu(){	
	sudo apt install nodejs;
	sudo apt install npm -y;
	npm install -g serve;

	user=`whoami`
	if [ -d /home/$user/compartir ]
	then
	   	sudo chmod +777 /home/$user/compartir
	else
		sudo mkdir -p /home/$user/compartir
		sudo ln -s /home/$user/compartir  /home/$user/Escritorio
		sudo chmod +777 /home/$user/compartir
	fi	
	ubic=`pwd`
	#`PATH=$PATH:$ubic`
	#echo "$ubic"
	read -p "Indique la clave que va tener el hotspot "  o
	sudo cp compartir.sh /usr/local/bin
	sudo cp compartir.sh /usr/bin
	placa=`nmcli | awk -F ":" '/wlp/{print $1}'`
	placa1=`echo $placa | awk '/wlp/{print $1}'`
	nmcli dev wifi hotspot ifname $placa1 ssid Compartir  password "$o"
	nmcli dev wifi show-password

	serve -p 1234 /home/$user/compartir

	nmcli networking off
	nmcli networking on
}

#Función para instalar Serve
server_ubuntu(){
	sudo apt install nodejs;
	sudo apt install npm -y; 
	npm install -g serve;

	user=`whoami`
	if [ -d /home/$user/compartir ]
	then
	   	sudo chmod +777 /home/$user/compartir
	else
		sudo mkdir -p /home/$user/compartir
		sudo ln -s /home/$user/compartir  /home/$user/Escritorio
		sudo chmod +777 /home/$user/compartir
	fi	
	sudo cp compartir.sh /usr/local/bin
	sudo cp compartir.sh /usr/bin	
	serve -p 1234 /home/$user/compartir
}

# Función para guía del usuario 
ayuda_ubuntu(){
	echo -e ""
	echo -e "--------------------------------------------------------------------------------------"
    echo -e "El siguiente Script se utiliza para compartir directorio ya sea como red desde la pc o"
    echo -e "desde la red wi-fi"
    echo -e "--------------------------------------------------------------------------------------"
	echo -e "Si selecciona la opción 1: Utiliza la máquina como router y comparte directorio Ubuntu o derivadas"
	echo -e "Si selecciona la opción 2: Comparte directorio Ubuntu o derivadas"
	echo -e "Si selecciona la opción 3: Ayuda (opción actual)"
	echo -e "Si selecciona la opción 4: Sale del programa"
    echo -e ""
}

# submenu
debian_ () {
	echo -e ""
	echo -e "--------------------------------------------------------------------------------------"
	echo -e "El siguiente Script se utiliza para compartir directorio ya sea como red desde la pc o"
	echo -e "desde la red wi-fi"
	echo -e "--------------------------------------------------------------------------------------"
	echo -e "Si selecciona la opción 1: Utiliza la máquina como router y comparte directorio Debian o derivadas (Ej: Huayra)"
	echo -e "Si selecciona la opción 2: Ayuda (opción actual)"
	echo -e "Si selecciona la opción 3: Sale del programa"
	echo -e ""	
	local PS3='Debian - Seleccione la opción que desea (1.Router y Server, 2.Ayuda, 3.Salir): '
	local options=("Router y Server" "Ayuda" "Salir")
	local opt
	select opt in "${options[@]}"
	do
	  case $opt in
	      "Router y Server")
	          nmcli_debian
	          ;;
	      "Ayuda")
	          ayuda_debian
	          ;;	          
	      "Salir")
	          return
	          ;;
	      *) echo "Opción Invalida $REPLY";;
	  esac
	done
}

# submenu
ubuntu_ () {
	echo -e ""
	echo -e "--------------------------------------------------------------------------------------"
	echo -e "El siguiente Script se utiliza para compartir directorio ya sea como red desde la pc o"
	echo -e "desde la red wi-fi"
	echo -e "--------------------------------------------------------------------------------------"
	echo -e "Si selecciona la opción 1: Utiliza la máquina como router y comparte directorio Ubuntu o derivadas"
	echo -e "Si selecciona la opción 2: Comparte directorio Ubuntu o derivadas"
	echo -e "Si selecciona la opción 3: Ayuda (opción actual)"
	echo -e "Si selecciona la opción 4: Sale del programa"
	echo -e ""	
	local PS3='Ubuntu - Seleccione la opción que desea (1.Router y Server, 2.Server, 3.Ayuda, 4.Salir): '
	local options=("Router y Server" "Server" "Ayuda" "Salir")
	local opt
	select opt in "${options[@]}"
	do
	  case $opt in
	      "Router y Server")
	          nmcli_ubuntu
	          ;;
	      "Server")
	          server_ubuntu
	          ;;
	      "Ayuda")
	          ayuda_ubuntu
	          ;;	          
	      "Salir")
	          return
	          ;;
	      *) echo "Opción Invalida $REPLY";;
	  esac
	done
}

verificar_debian(){
	IFS='.' read -a VERSION < /etc/debian_version
	if [[ $VERSION == "8" || $VERSION == "10" || $VERSION == "11" ]]; then 

	       	debian_
	else
			echo ""
			echo "Su versión no es compatible, debe ser Debian 9, Debian 10 o Debian 11"
			echo ""
			return
	fi	
}

verificar_ubuntu(){
	if [[ $(lsb_release -rs) == "20.04" || $(lsb_release -rs) == "22.04" ]]; then 

	       	ubuntu_
	else
			echo ""
	       	echo "Su versión no es compatible, debe ser Ubuntu 20.04 o Ubuntu 22.04"
	       	echo ""
	       	return
	fi	
}

version_(){
	cat /etc/*release
}

# main menu
echo -e "El siguiente Script se utiliza para compartir directorio ya sea como red desde la pc o"
echo -e "desde la red wi-fi"
echo -e "--------------------------------------------------------------------------------------"
echo -e "Importante, correr en Ubuntu 20.04 o 22.04 y derivadas, Debian entre 9 y 11"
echo -e "Huayra utiliza Debian"
echo -e "--------------------------------------------------------------------------------------"
echo -e "Si selecciona la opción 1: Utiliza Ubuntu"
echo -e "Si selecciona la opción 2: Utiliza Debian"
echo -e "Si selecciona la opción 3: Que GNU/Linux uso"
echo -e "Si selecciona la opción 4: Sale del programa"
echo -e ""
PS3='Por favor, ingrese en que sistema operativo de GNU/Linux se encuentra (1.Ubuntu, 2.Debian, 3.Que GNU/Linux uso , 4.Salir): '
options=("Ubuntu" "Debian" "Que GNU/Linux uso" "Salir")
select opt in "${options[@]}"
do
    case $opt in
        "Ubuntu")
            verificar_ubuntu
            ;;
        "Debian")
            verificar_debian
            ;;
        "Que GNU/Linux uso")
            version_
            ;;            
        "Salir")
            exit
            ;;
        *) echo "Opción invalida $REPLY";;
    esac
done
