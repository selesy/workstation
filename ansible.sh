#!/bin/bash

sudo apt-get install software-properties-common
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367
sudo apt-add-repository --yes 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main'
sudo apt-get update
sudo apt-get -y install git ansible
