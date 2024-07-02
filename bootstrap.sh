#!/usr/bin/env bash

#
# Install ASDF
#
sudo apt install -y git curl python3-venv python3-pip
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

#
# Install Ansible
#
~/.asdf/bin/asdf plugin add ansible-base
~/.asdf/bin/asdf install ansible-base latest
~/.asdf/bin/asdf global ansible-base latest

#
# Install Workstation
#
git clone https://github.com/selesy/workstation.git ~/.workstation --branch bookworm
