#!/bin/bash

if [[ -n $(git status --short) ]]; then
  echo "error: cannot renormalize: You have unstaged changes."
  echo "error: Please commit or stash them."
  exit 1
fi

git add --renormalize .

if [[ -z $(git status --short) ]]; then
  echo "nothing to renormalize"
  exit 0
fi

git commit -m "нормализация символов конца строки"
