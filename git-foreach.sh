#!/bin/bash

if [[ -z $1 ]]; then
  echo "args: <command> [<args>]"
  exit 1
fi

for i in */; do
  git -C $i status &> /dev/null &&
  ( set -x; git -C $i $@ )
done
