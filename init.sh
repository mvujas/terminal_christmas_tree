#!/bin/bash
BASEDIR=$(pwd)

echo >> ~/.bashrc
echo "# Christmastree script" >> ~/.bashrc
echo sh $BASEDIR/christmastree.sh >> ~/.bashrc
