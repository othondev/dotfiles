#!/bin/bash
while read package; do
	if ! dpkg -s "$package" >/dev/null 2>&1; then
		result=1
		echo "'$package' package not found"
	fi
done <./deps/list
exit $result
