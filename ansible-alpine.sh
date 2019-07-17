#!/bin/bash

sudo apk add git ansible openssh

if [ ! -d ~/.ssh ] ; then
  mkdir ~/.ssh
fi

if [ ! -f ~/.ssh/ansible-key ] ; then
  ssh-keygen -b 2048 -f ~/.ssh/ansible-key
fi

ssh-keyscan -H 127.0.0.1 >> ~/.ssh/known_hosts
ssh-keyscan -H localhost >> ~/.ssh/known_hosts

