#!/bin/bash

#CAPTURA ARGUMENTO
export HOSTNAME=zabbix-proxys

clear
# APRESENTA ARGUMENTO
echo ""
echo "#####################"
echo ""
echo "CONFIGURANDO HOSTNAME -> " $1
echo ""
echo "#####################"
echo ""
sleep 3

echo "$HOSTNAME" > /etc/hostname
echo "127.0.0.1     $HOSTNAME" >> /etc/hosts
hostname $HOSTNAME

clear
#### INSTALA PACOTES BASICOS
echo ""
echo "#####################"
echo ""
echo "INSTALANDO PACOTES BASICOS"
echo ""
echo "#####################"
echo ""
sleep 3

apt update
apt install fail2ban sudo vim htop net-tools dnsutils curl tcpdump snmp apt-transport-https ca-certificates curl gnupg2 software-properties-common -y

clear
#### INSTALA DOCKER
echo ""
echo "#####################"
echo ""
echo "INSTALANDO DOCKER"
echo ""
echo "#####################"
echo ""
sleep 3

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - ; add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" ; apt update
apt install docker-ce -y

