#!/bin/bash

for i in */; do
  git -C $i tag --list | xargs git -C $i tag --delete && git -C $i fetch --tags
done
