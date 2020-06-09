#!/bin/bash

if [[ -z $1 ]]; then
  echo "args: <dir>"
  exit 1
fi

for i in $1; do
  magick "$i" -compress lzw "${i%.*}.pdf"
done
