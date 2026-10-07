#!/usr/bin/env bash
# Subshells and command groups: variable scope and working directory.
x=1
( x=2; cd /tmp; echo "in subshell: x=$x pwd=$PWD" )
echo "after subshell: x=$x"
{ x=3; echo "in group: x=$x"; }
echo "after group: x=$x"
count=0
printf 'a\nb\nc\n' | while read -r _; do count=$((count + 1)); done
echo "count after pipe (lost): $count"
