#!/usr/bin/env bash

# Samba defaults to prevent interactive install
echo "samba-common samba-common/workgroup string  WORKGROUP" | debconf-set-selections
echo "samba-common samba-common/dhcp boolean true" | debconf-set-selections
echo "samba-common samba-common/do_debconf boolean true" | debconf-set-selections

apt update
apt upgrade -y
apt install -y vim apt-transport-https curl ca-certificates software-properties-common gnupg2 git python3-pip

git clone --recursive https://github.com/trustedsec/ptf.git
cd ptf
pip install -r requirements.txt
./ptf <<EOF
use modules/install_update_all
yes
exit
EOF
