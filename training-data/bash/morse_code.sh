#!/usr/bin/env bash
set -euo pipefail

declare -A MORSE=(
    [A]=.- [B]=-... [C]=-.-. [D]=-.. [E]=. [F]=..-. [G]=--. [H]=.... [I]=.. [J]=.---
    [K]=-.- [L]=.-.. [M]=-- [N]=-. [O]=--- [P]=.--. [Q]=--.- [R]=.-. [S]=... [T]=-
    [U]=..- [V]=...- [W]=.-- [X]=-..- [Y]=-.-- [Z]=--..
    [0]=----- [1]=.---- [2]=..--- [3]=...-- [4]=....- [5]=..... [6]=-.... [7]=--... [8]=---.. [9]=----.
)
declare -A TEXT=()
for k in "${!MORSE[@]}"; do TEXT[${MORSE[$k]}]=$k; done

encode() {
    local word out=() codes i c
    for word in ${1^^}; do
        codes=()
        for ((i = 0; i < ${#word}; i++)); do
            c=${word:i:1}
            [[ -n ${MORSE[$c]:-} ]] && codes+=("${MORSE[$c]}")
        done
        out+=("${codes[*]}")
    done
    local IFS='/'
    echo "${out[*]}" | sed 's|/| / |g'
}

decode() {
    local word code out=() w
    while IFS= read -r word; do
        w=''
        for code in $word; do w+=${TEXT[$code]:-?}; done
        out+=("$w")
    done < <(sed 's| / |\n|g' <<<"$1")
    echo "${out[*]}"
}

m=$(encode 'SOS help 2024')
echo "$m"
decode "$m"
