#!/bin/sh

export GOROOT=/opt/go/{{ go_version }}
export GOPATH=~/go
export PATH=$PATH:$GOROOT/bin
