#!/bin/bash

if [[ -z $1 ]]; then
  echo "args: <tagname>"
  exit 1
fi

tagname=$1

git tag --delete $tagname
git push origin :$tagname
