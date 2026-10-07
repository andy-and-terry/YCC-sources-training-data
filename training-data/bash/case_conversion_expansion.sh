#!/usr/bin/env bash
set -euo pipefail

# Bash 4+ case-modification parameter expansions.
s="hello World"
echo "${s^}"     # first char upper
echo "${s^^}"    # all upper
echo "${s,}"     # first char lower
echo "${s,,}"    # all lower
echo "${s~~}"    # toggle case
echo "${s^^[aeiou]}"  # only vowels upper
