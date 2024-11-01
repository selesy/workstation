#!/usr/bin/env bash

export ANSIBLE_NOCOWS=1
ansible-playbook -K -i localhost, -e GITHUB_API_TOKEN=$GITHUB_API_TOKEN workstation.yml $*
