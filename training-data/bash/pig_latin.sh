#!/usr/bin/env bash
set -euo pipefail

pig_word() {
    local w=$1 lower=${1,,} out
    if [[ $lower =~ ^[aeiou] ]]; then
        out=${lower}way
    elif [[ $lower =~ ^([^aeiou]*qu)(.*)$ || $lower =~ ^([^aeiouy]+)(.*)$ ]]; then
        out=${BASH_REMATCH[2]}${BASH_REMATCH[1]}ay
    else
        out=${lower}ay
    fi
    [[ $w =~ ^[A-Z] ]] && out=${out^}
    echo "$out"
}

pig_latin() {
    local s=$1 out='' word
    while [[ $s =~ ^([^A-Za-z]*)([A-Za-z]+)(.*)$ ]]; do
        out+=${BASH_REMATCH[1]}
        word=${BASH_REMATCH[2]}
        s=${BASH_REMATCH[3]}
        out+=$(pig_word "$word")
    done
    echo "$out$s"
}

pig_latin 'The quick brown fox jumps over the lazy dog'
pig_latin 'Hello, rhythm and apple!'
