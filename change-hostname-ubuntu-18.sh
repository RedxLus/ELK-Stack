#!/bin/bash

# Script var
lasthn=$(hostname)

# Need to be run as sudo
if ! [ $(id -u) = 0 ]; then
    echo "El script debe ejecutarse como root." >&2
    echo "The script need to be run as root." >&2
    exit 1
fi

echo "Ingrese el nuevo hostname para esta máquina y presione enter:"
echo "Enter new hostname to this machine and press enter:"
read newhn

sudo hostnamectl set-hostname ${newhn}
sudo sed -i "s/${lasthn}/${newhn}/g" /etc/hosts

echo ""
echo "===== ENG ====="
echo "Finish. Please check the file:"
echo " cat /etc/hosts"
echo "And check if we change correctly the hostname running this command:"
echo " hostnamectl"
echo ""
echo ""
echo "===== ESP ====="
echo "Terminado. Por favor revise el archivo:"
echo " cat /etc/hosts"
echo "Y compruebe si está correcto el hostname ejecutando este comando:"
echo " hostnamectl"