#!/bin/bash

days_ago=$(( ( $(date +%s) - $1 ) / 86400 ))

if [ "$days_ago" -eq 0 ]; then
  echo "today"

elif [ "$days_ago" -eq 1 ]; then
  echo "yesterday"

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

  echo "$result"
fi
