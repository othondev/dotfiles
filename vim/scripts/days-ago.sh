#!/bin/bash

if [ -z $1 ]; then
  printf "no file date" 
  exit 1
fi

days_ago=$(( ( $(date +%s) - $1 ) / 86400 ))

if [ "$days_ago" -eq 0 ]; then
  printf "today"

elif [ "$days_ago" -eq 1 ]; then
  printf "yesterday"

else
  years=$((days_ago / 365))
  remaining_days=$((days_ago % 365))
  months=$((remaining_days / 30))
  days=$((remaining_days % 30))

  result=""
  if [ "$years" -gt 0 ]; then
    result="${years}y"
  fi
  if [ "$months" -gt 0 ]; then
    result="${result}${months}m"
  fi
  if [ "$days" -gt 0 ]; then
    result="${result}${days}d"
  fi

  printf "$result"
fi
