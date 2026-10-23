#!/usr/bin/env bash
# Without lastpipe, a piped while-loop runs in a subshell and loses variables
count=0
printf '%s\n' a b c | while read -r _; do ((count++)); done
echo "default: count=$count"

shopt -s lastpipe
count=0
printf '%s\n' a b c | while read -r _; do ((count++)); done
echo "lastpipe: count=$count"
