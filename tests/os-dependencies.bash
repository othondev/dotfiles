#!/bin/bash
while read command; do
	if ! command -v "$command" >/dev/null 2>&1; then
		result=127
		echo "$command not found"
	fi
done <./deps/list
exit $result
