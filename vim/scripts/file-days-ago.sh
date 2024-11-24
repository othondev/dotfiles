#!/bin/bash

file=$1

if [ -z $1 ]; then
  printf "missing path" || exit 1;
fi

seconds_ago=$({ git log -1 --format=%ct -- "$file" || stat -c %Y "$file"; } 2>/dev/null || printf "")

if [ -z $seconds_ago ]; then
  exit 0
fi

bash ~/.vim/scripts/days-ago.sh $seconds_ago
