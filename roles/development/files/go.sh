#!/bin/sh

export GOROOT=/opt/go/{{ go_version }}
export GOPATH=~/go:{{ go_tools_directory }}
export PATH=$PATH:$GOROOT/bin:{{ go_tools_directory }}/bin:~/go/bin
