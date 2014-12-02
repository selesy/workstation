#!/bin/bash

sudo apt-get -y install git

sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update

sudo apt-get -y install ansible

if [ ! -d ~/.ssh ] ; then
  mkdir ~/.ssh
fi

if [ ! -f ~/.ssh/ansible-key ] ; then
  ssh-keygen -b 2048 -f ~/.ssh/ansible-key
fi

