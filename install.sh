#!/bin/bash

###########
#
# Dev workstation installation controller
# Calls setup scripts in required order with dependency updates and ssh settings
#
# author: jsinger1225
# email: jamie.singer@gmail.com
#
###########

# updates dependencies, setup loopback ssh key, and installs ansible
./ansible.sh

# ssh through loopback for dev workstation setup
./bootstrap.sh 127.0.0.1

# install dev tools
./workstation.sh
