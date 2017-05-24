#!/bin/bash

now="$(date +'%Y-%m-%d %T')"
git add .
git commit -a -m "Update $now "
git push -u origin master
