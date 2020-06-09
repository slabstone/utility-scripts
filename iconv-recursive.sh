#!/bin/bash

dir=${1:-.}
from=CP1251
to=UTF-8

for i in $(find $dir -iname '*.h' -o -iname '*.cpp'); do
  iconv-in-place.sh $i $from $to
done
