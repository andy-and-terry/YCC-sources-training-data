#!/usr/bin/env bash
set -euo pipefail

build_lps() {
    local pattern=$1
    local -n lps_out=$2
    local m=${#pattern}
    local len=0
    local i=1
    lps_out[0]=0

    while ((i < m)); do
        if [[ "${pattern:i:1}" == "${pattern:len:1}" ]]; then
            len=$((len + 1))
            lps_out[i]=$len
            i=$((i + 1))
        elif ((len != 0)); then
            len=${lps_out[len - 1]}
        else
            lps_out[i]=0
            i=$((i + 1))
        fi
    done
}

kmp_search() {
    local text=$1
    local pattern=$2
    local n=${#text}
    local m=${#pattern}
    local -a lps
    build_lps "$pattern" lps

    local -a matches
    local i=0 j=0
    while ((i < n)); do
        if [[ "${text:i:1}" == "${pattern:j:1}" ]]; then
            i=$((i + 1))
            j=$((j + 1))
            if ((j == m)); then
                matches+=($((i - j)))
                j=${lps[j - 1]}
            fi
        elif ((j != 0)); then
            j=${lps[j - 1]}
        else
            i=$((i + 1))
        fi
    done
    echo "${matches[@]}"
}

kmp_search "ababcabcabababd" "ababd"
kmp_search "aaaaa" "aa"
