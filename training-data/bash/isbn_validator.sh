#!/usr/bin/env bash
set -euo pipefail

isbn10_ok() {
    local s=$1 sum=0 i d
    [[ $s =~ ^[0-9]{9}[0-9X]$ ]] || return 1
    for ((i = 0; i < 10; i++)); do
        d=${s:i:1}; [[ $d == X ]] && d=10
        sum=$((sum + d * (10 - i)))
    done
    ((sum % 11 == 0))
}

isbn13_sum() { local s=$1 sum=0 i; for ((i = 0; i < ${#s}; i++)); do sum=$((sum + ${s:i:1} * (i % 2 ? 3 : 1))); done; echo "$sum"; }

isbn13_ok() { [[ $1 =~ ^[0-9]{13}$ ]] && (($(isbn13_sum "$1") % 10 == 0)); }

validate() {
    local s=${1//[- ]/}
    s=${s^^}
    case ${#s} in
        10) isbn10_ok "$s" && echo "valid ISBN-10" || echo "bad ISBN-10 checksum" ;;
        13) isbn13_ok "$s" && echo "valid ISBN-13" || echo "bad ISBN-13 checksum" ;;
        *) echo "invalid length ${#s}" ;;
    esac
}

to13() {
    local core="978${1//-/}"
    core=${core:0:12}
    echo "$core$(((10 - $(isbn13_sum "$core") % 10) % 10))"
}

for s in 0-306-40615-2 0-306-40615-3 978-0-306-40615-7 0-8044-2957-X 12345; do
    printf '%-18s %s\n' "$s" "$(validate "$s")"
done
echo "to ISBN-13: $(to13 0-306-40615-2)"
