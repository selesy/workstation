#!/bin/bash

export ANSIBLE_NOCOWS=1
ansible-playbook --private-key=~/.ssh/ansible-key -i ansible_inventory.ini workstation.yml $*

