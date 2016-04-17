#!/bin/bash

sudo docker rm -f $(sudo docker ps -aq)

sudo umount `cat /proc/mounts | grep /var/lib/kubelet | awk '{print $2}'` 
sudo rm -rf /var/lib/kubelet

