#!/bin/bash

input="$1"

file="${input%:*}"
line="${input##*:}"

if [ -z $file ]; then
  printf "no file" 
  exit 1
fi

if [ -z $line ]; then
  printf "no line" 
  exit 1
fi

blame_info=$(git blame -L "$line","$line" --line-porcelain "$file" 2>/dev/null || printf "")

author=$(printf "%s" "$blame_info" | grep "^author " | cut -d' ' -f2-)
commit_date=$(printf "%s" "$blame_info" | grep "^author-time " | cut -d' ' -f2)

printf "$author ($(bash ~/.vim/scripts/days-ago.sh $commit_date))"
