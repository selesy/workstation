#!/bin/sh

export ANSIBLE_NOCOWS=1
ansible-playbook -K -i localhost, clean.yml $*

rm -f ansible_inventory.ini
