#!/usr/bin/env bash
# Palindrome check ignoring case and non-alphanumerics.
is_pal() {
    local s=${1,,}
    s=${s//[^a-z0-9]/}
    local r=""
    for ((i = ${#s} - 1; i >= 0; i--)); do r+=${s:i:1}; done
    [[ $s == "$r" ]]
}
for t in "A man, a plan, a canal: Panama" "hello" "Was it a car or a cat I saw?"; do
    is_pal "$t" && echo "yes: $t" || echo "no:  $t"
done
