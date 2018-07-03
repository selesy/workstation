#!/bin/sh

export GOROOT=/usr/lib/go-{{ go_version }}
export PATH=$PATH:$GOROOT/bin
