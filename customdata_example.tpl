#!/bin/bash
echo "-+-+ -+-+ -+-+ -+-+ -+-+ -+-+   Start Update -+-+ -+-+ -+-+ -+-+ -+-+ -+-+"
sudo apt-get update -y &&
sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
sudo \
software-properties-common &&
echo "-+-+ -+-+ -+-+ -+-+ -+-+ -+-+   Setting Up ansible user   -+-+ -+-+ -+-+ -+-+ -+-+ -+-+"
# openssl passwd -6 -salt AnySalt 'any password' # <- use this to make the pass string
sudo groupadd ansible -g4100
sudo useradd -p '$6$AnySalt$Faf3dzRjtnQfoQorsSwEIUwVWE/TWV7PI9nb8sOKDzAnoCYgFaoPFEGwXzuwlwRvDbLQnIjOnVRfsMoHDKKRo/' -u4100 -g4100 -d/home/ansible -s/bin/bash ansible
sudo usermod -aG sudo ansible

echo "-+-+ -+-+ -+-+ -+-+ -+-+ -+-+   Write ansible sudoer file  -+-+ -+-+ -+-+ -+-+ -+-+ -+-+"
# adding sudo file to system
sudo cat << EOF >> /etc/sudoers.d/ansible_nopass
zod ALL=(ALL) NOPASSWD: ALL
EOF
### 

echo "-+-+ -+-+ -+-+ -+-+ -+-+ -+-+   Adding ansible public key  -+-+ -+-+ -+-+ -+-+ -+-+ -+-+"
sudo mkdir -p /home/zod/.ssh
# adding zod publickey to system user
sudo cat << EOF >> /home/ansible/.ssh/anthorized_keys
ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbm..................."
EOF
### 
echo "-+-+ -+-+ -+-+ -+-+ -+-+ -+-+   Finished Setup  -+-+ -+-+ -+-+ -+-+ -+-+ -+-+"