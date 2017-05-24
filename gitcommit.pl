#!/bin/bash

#now="$(date +'%Y-%m-%d %T')"
git add .
git commit -m "Update $now "
git push -u origin master
