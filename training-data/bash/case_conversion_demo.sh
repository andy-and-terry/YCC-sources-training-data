#!/usr/bin/env bash
set -euo pipefail

s="hello World from Bash"

echo "${s^^}"        # all upper case
echo "${s,,}"        # all lower case
echo "${s^}"         # first character upper
echo "${s,}"         # first character lower
echo "${s~~}"        # swap case of every character

# Capitalize each word
title=""
for word in $s; do
    lower=${word,,}
    title+="${lower^} "
done
echo "${title% }"

# Case-insensitive comparison without external tools
a="Yes"
b="yEs"
if [[ ${a,,} == "${b,,}" ]]; then
    echo "equal ignoring case"
fi

# declare attributes convert on assignment
declare -u shout="quiet"
declare -l whisper="LOUD"
echo "$shout $whisper"
