#!/bin/bash

now="$(date +'%d/%m/%Y')"

git add .
git commit -m "Update '$now'"
git push -u origin master
