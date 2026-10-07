#!/usr/bin/env bash
set -euo pipefail

x=1

# ( ) runs in a subshell: changes do not persist
( x=2; cd /tmp; echo "subshell: x=$x pwd=$PWD" )
echo "after subshell: x=$x pwd=$PWD"

# { } runs in the current shell: changes persist
{ x=3; echo "group: x=$x"; }
echo "after group: x=$x"

# A pipeline's last stage runs in a subshell (unless lastpipe is on)
count=0
printf 'a\nb\nc\n' | while read -r _; do count=$((count + 1)); done
echo "count after pipe loop: $count"

# Process substitution keeps the loop in the current shell
count=0
while read -r _; do count=$((count + 1)); done < <(printf 'a\nb\nc\n')
echo "count after redirected loop: $count"

# Group commands to redirect together
{ echo "line one"; echo "line two"; } | tr a-z A-Z
