#!/bin/bash

shopt -s nullglob
for i in *.doc *.docx; do
  OfficeToPDF.exe //bookmarks //hidden //readonly //print //pdfa "$i"
done
