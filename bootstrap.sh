#!/usr/bin/env bash

sudo apt update
sudo apt install -y curl git ansible python3-venv python3-pip
sudo apt upgrade

git clone https://github.com/selesy/workstation.git ~/.workstation --branch bookworm
# ln -s "$HOME/.workstation/workstation.sh" "$HOME/bin/workstation"
