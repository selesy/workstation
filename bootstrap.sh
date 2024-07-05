#!/usr/bin/env bash

#
# Install ASDF
#
sudo apt install -y git curl python3-venv python3-pip

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
echo
echo "# BEGIN ANSIBLE MANAGED BLOCK for asdf" >> "$HOME/.bashrc"
echo '. "$HOME/.asdf/asdf.sh"' >> "$HOME/.bashrc"
echo '. "$HOME/.asdf/completions/asdf.bash"' >> "$HOME/.bashrc"
echo "# END ANSIBLE MANAGED BLOCK for asdf" >> "$HOME/.bashrc"

#
# Install Ansible via asdf
#
"$HOME/.asdf/bin/asdf" plugin add ansible-base
"$HOME/.asdf/bin/asdf" install ansible-base 2.10.17
"$HOME/.asdf/bin/asdf" global ansible-base 2.10.17

#
# Make a bin directory in the user's home directory
#
mkdir -p "$HOME/bin"
echo
echo "# BEGIN ANSIBLE MANAGED BLOCK FOR \$HOME/bin"
echo 'export "PATH=$HOME/bin:$PATH"' >> "$HOME/.bashrc"
echo "# END ANSIBLE MANAGED BLOCK FOR \$HOME/bin"

#
# Install Workstation
#
git clone https://github.com/selesy/workstation.git ~/.workstation --branch bookworm
ln -s "$HOME/.workstation/workstation.sh" "$HOME/bin/workstation"

#
# Remind user to reinitialize shell
#
echo
echo ***** IMPORTANT *****
echo
echo Remember to re-intialize your shell using the following command:
echo
echo . "$HOME/.bashrc"
echo