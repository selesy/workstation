#!/usr/bin/env bash

#
# Install ASDF
#
sudo apt install -y git curl python3-venv python3-pip
pip3 install pip --upgrade
pip3 install wheel --upgrade

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
echo '. "$HOME/.asdf/asdf.sh"' >> "$HOME/.bashrc"
echo '. "$HOME/.asdf/completions/asdf.bash"' >> "$HOME/.bashrc"
reset

#
# Install Ansible
#
ASDF_PYAPP_INCLUDE_DEPS=1 asdf plugin add ansible https://github.com/amrox/asdf-pyapp.git
ASDF_PYAPP_INCLUDE_DEPS=1 asdf install ansible latest
ASDF_PYAPP_INCLUDE_DEPS=1 asdf global ansible latest

#
# Install Workstation
#
git clone https://github.com/selesy/workstation.git ~/.workstation --branch bookworm
