#!/usr/bin/env bash
set -euo pipefail

# Polynomials are coefficient lists, lowest degree first: "1 -3 2" = 2x^2 - 3x + 1.
trim() { local c=($1); while ((${#c[@]} > 1 && c[-1] == 0)); do unset 'c[-1]'; done; echo "${c[*]}"; }

padd() {
    local a=($1) b=($2) n i out=()
    n=$((${#a[@]} > ${#b[@]} ? ${#a[@]} : ${#b[@]}))
    for ((i = 0; i < n; i++)); do out+=($((${a[i]:-0} + ${b[i]:-0}))); done
    trim "${out[*]}"
}

pmul() {
    local a=($1) b=($2) i j out=()
    for ((i = 0; i < ${#a[@]} + ${#b[@]} - 1; i++)); do out[i]=0; done
    for ((i = 0; i < ${#a[@]}; i++)); do
        for ((j = 0; j < ${#b[@]}; j++)); do out[i + j]=$((out[i + j] + a[i] * b[j])); done
    done
    trim "${out[*]}"
}

pderiv() { local a=($1) i out=(); for ((i = 1; i < ${#a[@]}; i++)); do out+=($((i * a[i]))); done; trim "${out[*]:-0}"; }

peval() { local a=($1) x=$2 v=0 i; for ((i = ${#a[@]} - 1; i >= 0; i--)); do v=$((v * x + a[i])); done; echo "$v"; }

pstr() {
    local a=($1) i k s='' coef term
    for ((i = ${#a[@]} - 1; i >= 0; i--)); do
        k=${a[i]}
        ((k == 0 && ${#a[@]} > 1)) && continue
        if ((i > 0 && (k == 1 || k == -1))); then coef=${k%1}; else coef=$k; fi
        case $i in 0) term=$coef ;; 1) term="${coef}x" ;; *) term="${coef}x^$i" ;; esac
        if [[ -z $s ]]; then s=$term
        elif [[ $term == -* ]]; then s+=" - ${term#-}"
        else s+=" + $term"; fi
    done
    echo "$s"
}

p='1 -3 2' q='-1 1'
echo "p = $(pstr "$p")"
echo "q = $(pstr "$q")"
echo "p + q = $(pstr "$(padd "$p" "$q")")"
echo "p * q = $(pstr "$(pmul "$p" "$q")")"
echo "p' = $(pstr "$(pderiv "$p")")"
echo "p(3) = $(peval "$p" 3)"
