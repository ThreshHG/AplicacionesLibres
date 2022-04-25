#!/bin/bash
areglo=('nodejs' 'npm' 'serve')

#echo "$areglo"
#echo "${areglo[@]}"

for i in ${areglo[@]}
do
which $i
o=`echo $?`

if [ $o -le 0 ];
then
echo " $i YA SE ENCUENTRA INSTALADO EN EL SISTEMA"
else 
echo -e  "NO SE ENCUENTRA INSTALADO $i"
sudo apt install  $i -y
sudo npm install -g $i

fi
done 
cd $user
mkdir compartir
serve -p 1234  compartir

