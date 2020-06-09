#!/bin/bash

if [[ -z $1 ]]; then
  echo "args: <subcommand> [<option>...]"
  exit 1
fi

for i in */; do
  svn info $i &> /dev/null &&  # проверка того, что это SVN-репозиторий
  ( set -x; svn $@ $i )  # выполнение команды с выводом этой команды
done
