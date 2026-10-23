#!/usr/bin/env bash
set -euo pipefail

# Extended globs add regex-like operators to [[ == ]] and case patterns:
#   ?(a|b) zero or one   *(a|b) zero or more   +(a|b) one or more
#   @(a|b) exactly one   !(a|b) anything except
shopt -s extglob

classify() {
  case $1 in
    +([0-9]))            echo "$1: integer" ;;
    ?(-)+([0-9]).+([0-9])) echo "$1: decimal" ;;
    @(yes|no|maybe))     echo "$1: answer word" ;;
    *.@(jpg|png|gif))    echo "$1: image file" ;;
    !(*.*))              echo "$1: no extension" ;;
    *)                   echo "$1: other" ;;
  esac
}

for item in 42 -3.14 maybe photo.png README notes.txt; do
  classify "$item"
done

# Match everything except one suffix, using the same operators in [[ ]].
for f in a.c b.h c.o d.c; do
  if [[ $f == !(*.o) ]]; then
    echo "$f is a source or header"
  fi
done

# Strip trailing slashes with an extglob parameter expansion.
path="/usr/local///"
echo "${path%%+(/)}"
