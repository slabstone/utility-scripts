#!/bin/bash

if [[ -z $1 ]]; then
  echo "args: <filename> [<from> <to>]"
  exit 1
fi

filename=$1
from=${2:-CP1251}
to=${3:-UTF-8}

tmp=$(mktemp -p .) &&
iconv -f $from -t $to $filename > $tmp &&
mv $tmp $filename
