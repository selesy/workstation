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
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

#
# Install Ansible via asdf
#
asdf plugin add ansile-base
asdf install ansible-base 2.10.17
asdf global ansible-base 2.10.17

#
# Make a bin directory in the user's home directory
#
mkdir -p "$HOME/bin"
echo 'export "PATH=$HOME/bin:$PATH"' >> "$HOME/.bashrc"
export "PATH=$HOME/bin:$PATH"

#
# Install Workstation
#
git clone https://github.com/selesy/workstation.git ~/.workstation --branch bookworm
ln -s "$HOME/.workstation/workstation.sh" "$HOME/bin/workstation"
