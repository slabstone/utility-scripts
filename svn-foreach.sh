#!/bin/bash

if [[ -z $1 ]]; then
  echo "args: <subcommand> [<option>...]"
  exit 1
fi

for i in */; do
  svn info $i &> /dev/null &&
  ( set -x; svn $@ $i )
done
