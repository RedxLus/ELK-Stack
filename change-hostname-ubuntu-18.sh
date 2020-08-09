#!/bin/bash

lasthostname=$(hostname)

echo "Remember need sudo."
echo "enter new hostname to this machine and press enter:"
read newhn

sudo hostnamectl set-hostname ${newhn}

sudo sed -i "s/${lasthostname}/${newhn}/g" /etc/hosts

echo "Finish. We changed this file, please check:"
echo "/etc/hosts"
echo "Check if we change correctly the hostname running this command:"
echo "hostnameclt"