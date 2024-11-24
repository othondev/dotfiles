#!/bin/bash

input="$1"

file="${input%:*}"
line="${input##*:}"

blame_info=$(git blame -L "$line","$line" --line-porcelain "$file")
author=$(echo "$blame_info" | grep "^author " | cut -d' ' -f2-)
commit_date=$(echo "$blame_info" | grep "^author-time " | cut -d' ' -f2)

echo "- $(bash ~/.vim/scripts/days-ago.sh $commit_date) [$author]"
