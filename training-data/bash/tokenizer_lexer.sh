#!/usr/bin/env bash
set -euo pipefail

declare -A KEYWORDS=([let]=1 [if]=1 [else]=1 [while]=1 [return]=1 [fn]=1)

tokenize() {
    local s=$1 line=1 t
    while [[ -n $s ]]; do
        if [[ $s =~ ^$'\n' ]]; then line=$((line + 1)); s=${s:1}; continue; fi
        if [[ $s =~ ^[[:blank:]]+ ]]; then s=${s:${#BASH_REMATCH[0]}}; continue; fi
        if [[ $s =~ ^#[^$'\n']* ]]; then s=${s:${#BASH_REMATCH[0]}}; continue; fi
        if [[ $s =~ ^[0-9]+(\.[0-9]+)? ]]; then
            t=${BASH_REMATCH[0]}; echo "$line NUMBER $t"
        elif [[ $s =~ ^[A-Za-z_][A-Za-z0-9_]* ]]; then
            t=${BASH_REMATCH[0]}
            if [[ -n ${KEYWORDS[$t]:-} ]]; then echo "$line KEYWORD $t"; else echo "$line IDENT $t"; fi
        elif [[ $s =~ ^\"([^\"\\]|\\.)*\" ]]; then
            t=${BASH_REMATCH[0]}; echo "$line STRING $t"
        elif [[ $s =~ ^(==|!=|<=|>=|&&|\|\||->) ]]; then
            t=${BASH_REMATCH[0]}; echo "$line OP $t"
        elif [[ $s =~ ^[-+*/%=\<\>!] ]]; then
            t=${BASH_REMATCH[0]}; echo "$line OP $t"
        elif [[ $s =~ ^[][(){},\;:] ]]; then
            t=${BASH_REMATCH[0]}; echo "$line PUNCT $t"
        else
            echo "$line ERROR unexpected '${s:0:1}'" >&2; t=${s:0:1}
        fi
        s=${s:${#t}}
    done
    echo "$line EOF"
}

src='fn add(a, b) -> int {   # sum
  return a + b;
}
let msg = "hi \"there\"";
if x >= 10 && y != 2.5 { print(msg); }'

tokenize "$src" | awk '{ printf "%-3s %-8s %s\n", $1, $2, substr($0, length($1 " " $2 " ") + 1) }'
