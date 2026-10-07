#!/usr/bin/env bash
set -euo pipefail

url_decode() { local s=${1//+/ }; printf '%b' "${s//%/\\x}"; }

url_encode() {
    local s=$1 out='' c i
    local LC_ALL=C
    for ((i = 0; i < ${#s}; i++)); do
        c=${s:i:1}
        case $c in
            [A-Za-z0-9._~-]) out+=$c ;;
            ' ') out+=+ ;;
            *) out+=$(printf '%%%02X' "'$c") ;;
        esac
    done
    echo "$out"
}

# Repeated keys collect multiple values; order of first appearance is kept.
declare -A params=()
order=()
parse_query() {
    local qs=${1#\?} pair k v
    local IFS='&'
    for pair in $qs; do
        [[ -z $pair ]] && continue
        k=$(url_decode "${pair%%=*}")
        if [[ $pair == *=* ]]; then v=$(url_decode "${pair#*=}"); else v=''; fi
        [[ -v params[$k] ]] || order+=("$k")
        params[$k]+="${params[$k]:+,}$v"
    done
}

parse_query '?name=J%C3%BCrgen+M&tag=a&tag=b&empty=&flag'
for k in "${order[@]}"; do echo "$k=[${params[$k]}]"; done

pairs=()
for k in "${order[@]}"; do
    IFS=, read -ra vals <<<"${params[$k]}"
    ((${#vals[@]})) || vals=('')
    for v in "${vals[@]}"; do pairs+=("$(url_encode "$k")=$(url_encode "$v")"); done
done
(IFS='&'; echo "${pairs[*]}")
