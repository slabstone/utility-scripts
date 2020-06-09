#!/bin/bash

git-foreach.sh clean -dfx -q
git-foreach.sh reset --hard origin/master -q
git-foreach.sh pull --all -q
svn-foreach.sh update
