#!/bin/bash

if [[ -z $1 ]]; then
  echo "args: <command> [<args>]"
  exit 1
fi

for i in */; do
  git -C $i status &> /dev/null &&  # проверка того, что это git-репозиторий
  ( set -x; git -C $i $@ )  # выполнение команды с выводом этой команды
done
