#!/usr/bin/env bash
set -euo pipefail

declare -A PREC=([+]=1 [-]=1 ['*']=2 [/]=2 [^]=3)
declare -A RIGHT=([^]=1)

to_rpn() {
    local s=$1 out=() ops=() t top
    while [[ -n $s ]]; do
        if [[ $s =~ ^[[:space:]]+ ]]; then s=${s:${#BASH_REMATCH[0]}}; continue; fi
        [[ $s =~ ^([0-9]+|[-+*/^()]) ]] || { echo "bad input" >&2; return 1; }
        t=${BASH_REMATCH[0]}; s=${s:${#t}}
        case $t in
            [0-9]*) out+=("$t") ;;
            '(') ops+=("$t") ;;
            ')') while [[ ${ops[-1]} != '(' ]]; do out+=("${ops[-1]}"); unset 'ops[-1]'; done
                 unset 'ops[-1]' ;;
            *) while ((${#ops[@]})); do
                   top=${ops[-1]}
                   [[ $top == '(' ]] && break
                   if ((PREC[$top] > PREC[$t])) || { ((PREC[$top] == PREC[$t])) && [[ -z ${RIGHT[$t]:-} ]]; }; then
                       out+=("$top"); unset 'ops[-1]'
                   else
                       break
                   fi
               done
               ops+=("$t") ;;
        esac
    done
    while ((${#ops[@]})); do out+=("${ops[-1]}"); unset 'ops[-1]'; done
    echo "${out[*]}"
}

# Evaluated with bc so division keeps its fractional part.
eval_rpn() {
    local st=() t a b toks
    read -ra toks <<<"$1"   # read -a avoids globbing the '*' token
    for t in "${toks[@]}"; do
        case $t in
            [0-9]*) st+=("$t") ;;
            *) b=${st[-1]}; unset 'st[-1]'; a=${st[-1]}; unset 'st[-1]'
               st+=("($a)$t($b)") ;;
        esac
    done
    bc -l <<<"scale=10; ${st[0]}" | sed -E 's/\.?0+$//'
}

for e in '3 + 4 * 2 / (1 - 5) ^ 2 ^ 3' '(1 + 2) * (3 + 4)' '2 ^ 3 ^ 2'; do
    rpn=$(to_rpn "$e")
    echo "$e => $rpn = $(eval_rpn "$rpn")"
done
