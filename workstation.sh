#!/bin/bash

ansible-playbook --private-key=~/.ssh/ansible-key -i ansible_inventory.ini workstation.yml

