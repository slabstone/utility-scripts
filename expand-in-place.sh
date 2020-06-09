#!/bin/bash

if [[ -z $1 ]]; then
  echo "args: <filename>"
  exit 1
fi

filename=$1
tabstop=4

tmp=$(mktemp -p .) &&
expand -t $tabstop $filename > $tmp &&
mv $tmp $filename
