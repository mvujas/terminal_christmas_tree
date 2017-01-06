#!/bin/bash
export BASEDIR=~/$(dirname $0)

echo >> ~/.bashrc
echo "# Christmastree script" >> ~/.bashrc
echo sh $BASEDIR/christmastree.sh >> ~/.bashrc
