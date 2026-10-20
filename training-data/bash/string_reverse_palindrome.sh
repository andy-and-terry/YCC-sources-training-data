#!/usr/bin/env bash
set -euo pipefail

rev_str() { local s=$1 r=; for ((i = ${#s} - 1; i >= 0; i--)); do r+=${s:i:1}; done; echo "$r"; }
is_pal() { local c=${1,,}; c=${c//[^a-z0-9]/}; [[ $c == "$(rev_str "$c")" ]]; }
echo "$(rev_str hello)"
is_pal "A man, a plan, a canal: Panama" && echo palindrome
is_pal "hello" || echo "not palindrome"
