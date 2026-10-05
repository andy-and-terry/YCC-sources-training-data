#!/usr/bin/env bash
set -euo pipefail

is_balanced() {
    local s=$1 stack=() ch top i
    declare -A pair=([')']='(' [']']='[' ['}']='{')
    for ((i = 0; i < ${#s}; i++)); do
        ch=${s:i:1}
        case $ch in
            '(' | '[' | '{') stack+=("$ch") ;;
            ')' | ']' | '}')
                ((${#stack[@]} > 0)) || return 1
                top=${stack[-1]}
                [[ $top == "${pair[$ch]}" ]] || return 1
                unset 'stack[-1]'
                ;;
        esac
    done
    ((${#stack[@]} == 0))
}

for t in "()[]{}" "([)]" "{[()]}" "((" ; do
    if is_balanced "$t"; then echo "$t: balanced"; else echo "$t: unbalanced"; fi
done
