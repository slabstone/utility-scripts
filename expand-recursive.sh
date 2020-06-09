#!/bin/bash

if [[ -z $1 ]]; then
  echo "args: <dir>"
  exit 1
fi

dir=${1:-.}

for i in $(find $dir -iname '*.h' -o -iname '*.cpp'); do
  expand-in-place.sh $i
done
