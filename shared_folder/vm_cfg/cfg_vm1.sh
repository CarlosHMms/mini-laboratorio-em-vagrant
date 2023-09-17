#!/bin/bash
#Instalando as ferramentas de desenvolvimento
apt-get update
apt-get -y install net-tools

#Configurando a rede, ativando o ip_forward e configurando as regras de NAT
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE