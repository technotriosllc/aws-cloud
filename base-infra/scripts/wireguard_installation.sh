#!/bin/bash

## Instance SSM agent #####
mkdir /tmp/ssm
cd /tmp/ssm
wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb
sudo dpkg -i amazon-ssm-agent.deb
sudo systemctl enable amazon-ssm-agent

#Instaling required packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install wireguard wireguard-tools -y
echo "Generating private_key"

#Configuration
mkdir /etc/wireguard >/dev/null 2>&1

sudo chmod 660 -R /etc/wireguard/

SERVER_PRIV_KEY=$(wg genkey)
SERVER_PUB_KEY=$(echo "${SERVER_PRIV_KEY}" | wg pubkey)

sudo tee -a /etc/wireguard/wg0.conf << END
[Interface]
Address = 172.168.0.1/24 # your choose of network ip range
ListenPort = 51820
PrivateKey = PRIVATE-KEY
PostUp = iptables -A FORWARD -i eth0 -o wg0 -j ACCEPT; iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i eth0 -o wg0 -j ACCEPT; iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE"
END

sudo sed -i -r 's/(PRIVATE-KEY)/'"$SERVER_PRIV_KEY"'/' /etc/wireguard/wg0.conf
sudo  echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

# start and enable service
sudo systemctl enable wg-quick@wg0.service
sudo systemctl start wg-quick@wg0.service