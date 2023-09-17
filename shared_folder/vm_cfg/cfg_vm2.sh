#!/bin/bash
#Instalando as ferramentas de desenvolvimento
apt-get update
apt-get install -y apache2
apt-get install -y net-tools

#Configurando a rede e definindo o gateway
sudo ip route del default
sudo route add default gw 192.168.56.254
sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf