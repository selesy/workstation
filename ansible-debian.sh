#!/bin/bash

sudo apt-get install software-properties-common
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367
sudo apt-add-repository --yes 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main'
sudo apt-get update
sudo apt-get -y install git ansible

# Install and start the SSH server
sudo apt-get -y install openssh-client
sudo apt-get -y install openssh-server
sudo service ssh start

if [ ! -d ~/.ssh ] ; then
  mkdir ~/.ssh
fi

if [ ! -f ~/.ssh/ansible-key ] ; then
  ssh-keygen -b 2048 -f ~/.ssh/ansible-key
fi

ssh-keyscan -H 127.0.0.1 >> ~/.ssh/known_hosts
ssh-keyscan -H localhost >> ~/.ssh/known_hosts

