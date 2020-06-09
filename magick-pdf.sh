#!/bin/bash

if [[ -z $1 ]]; then
  echo "args: <input-file> [<output-file>]"
  exit 1
fi

input=$1

if [[ -n $2 ]]; then
  output=$2
else
  output=${input%.*}
fi

magick "$input" -compress lzw "$output.pdf"
