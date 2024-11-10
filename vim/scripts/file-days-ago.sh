#!/bin/bash

file=$1

if [ -z $1 ]; then
  echo "missing path" || exit 1;
fi

seconds_ago=$(git log -1 --format=%ct -- "$file" 2>/dev/null || stat -c %Y "$file")

if [ -z $seconds_ago ]; then
  exit 0
fi

days_ago=$(( ( $(date +%s) - $seconds_ago ) / 86400 ))

if [ "$days_ago" -eq 0 ]; then
    echo "today"
elif [ "$days_ago" -eq 1 ]; then
    echo "yesterday"
elif [ "$days_ago" -gt 99 ]; then
    echo "+99 days ago"
else
    echo "$days_ago days ago"
fi
