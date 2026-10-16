#!/usr/bin/env bash
# Validate a password-like string by length and character classes.
check() {
    local p=$1 ok=1
    (( ${#p} >= 8 )) || { echo "too short"; ok=0; }
    [[ $p == *[[:upper:]]* ]] || { echo "needs upper"; ok=0; }
    [[ $p == *[[:digit:]]* ]] || { echo "needs digit"; ok=0; }
    (( ok )) && echo "'$p' ok"
}
check "abc"
check "Passw0rdXYZ"
