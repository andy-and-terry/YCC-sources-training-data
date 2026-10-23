#!/usr/bin/env bash
set -euo pipefail

# Bash 4.4+ parameter transformation: ${var@OP}
#   @Q shell-quoted   @U uppercase   @L lowercase   @u capitalize first char
#   @E expand backslash escapes      @a attribute flags
name='hello World $HOME'
echo "raw:     $name"
echo "@Q:      ${name@Q}"
echo "@U:      ${name@U}"
echo "@L:      ${name@L}"
echo "@u:      ${name@u}"

escaped='line one\nline two\ttabbed'
echo "@E:"
echo "${escaped@E}"

# @Q is the safe way to build a command line for later eval or logging.
file="my file's name.txt"
cmd="ls -l ${file@Q}"
echo "$cmd"

declare -i n=3
declare -r r=1
declare -a arr=(a b)
echo "attrs: n=${n@a} r=${r@a} arr=${arr@a}"

# Applied to arrays, the operator applies per element.
words=(alpha beta gamma)
echo "${words[@]@U}"
