#!/bin/bash

now="$(date +'%a - %d %b %Y - %T')"
git add .
git commit -a -m "Update $now "
git push -u origin master
