#!/bin/sh

export ANSIBLE_NOCOWS=1
ansible-playbook -K -i localhost, workstation.yml $*
