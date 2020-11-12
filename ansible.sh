#!/bin/bash

sudo apt-get install software-properties-common
sudo apt-add-repository --yes 'ppa:ansible/ansible xenial'
sudo apt-get update
sudo apt-get -y install git ansible
sudo apt-get -y install openssh-client
sudo apt-get -y install openssh-server

if [ ! -d ~/.ssh ] ; then
  mkdir ~/.ssh
fi

if [ ! -f ~/.ssh/ansible-key ] ; then
  ssh-keygen -b 2048 -f ~/.ssh/ansible-key
fi

ssh-keyscan -H 127.0.0.1 >> ~/.ssh/known_hosts
ssh-keyscan -H localhost >> ~/.ssh/known_hosts

