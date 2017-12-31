#!/bin/bash

if [ $# -gt 0 ] && [ -n $1 ] ; then
  echo "Target host: $1"
else
  echo "This script requires one argument that contains an IP address"
  echo "or hostname."
  exit 1
fi

ssh-keyscan -H $1 >> ~/.ssh/known_hosts

sudo apt-get -y install openssh-server sshpass

echo "[targets]" > ansible_inventory.ini
echo "" >> ansible_inventory.ini
echo "$1" >> ansible_inventory.ini

export ANSIBLE_NOCOWS=1
ansible-playbook -k -K -i ansible_inventory.ini bootstrap.yml

