#!/usr/bin/env bash
set -euo pipefail

# Recursive-descent parser for integer expressions:
#   expr   := term (('+'|'-') term)*
#   term   := factor (('*'|'/'|'%') factor)*
#   factor := unary ('^' factor)?
#   unary  := '-' unary | NUMBER | VAR | '(' expr ')'
# Parse functions leave their value in the global RESULT so no subshells are needed.
declare -A vars=([x]=3 [y]=7)
tokens=() pos=0 RESULT=0

fail() { echo "error: $1"; exit 1; }
peek() { PEEK=${tokens[pos]:-}; }

tokenize() {
    local s=$1
    tokens=() pos=0
    while [[ -n $s ]]; do
        if [[ $s =~ ^[[:space:]]+ ]]; then :
        elif [[ $s =~ ^[0-9]+ || $s =~ ^[A-Za-z_][A-Za-z0-9_]* || $s =~ ^[-+*/%^()] ]]; then
            tokens+=("${BASH_REMATCH[0]}")
        else
            fail "unexpected '${s:0:1}'"
        fi
        s=${s:${#BASH_REMATCH[0]}}
    done
}

parse_expr() {
    local v op
    parse_term; v=$RESULT
    peek
    while [[ $PEEK == [-+] ]]; do
        op=$PEEK; pos=$((pos + 1))
        parse_term
        v=$((v $op RESULT))
        peek
    done
    RESULT=$v
}

parse_term() {
    local v op
    parse_factor; v=$RESULT
    peek
    while [[ $PEEK == [*/%] ]]; do
        op=$PEEK; pos=$((pos + 1))
        parse_factor
        [[ $op != '*' ]] && ((RESULT == 0)) && fail "division by zero"
        v=$((v $op RESULT))
        peek
    done
    RESULT=$v
}

parse_factor() {
    local base
    parse_unary; base=$RESULT
    peek
    if [[ $PEEK == '^' ]]; then
        pos=$((pos + 1))
        parse_factor # right-associative
        RESULT=$((base ** RESULT))
    else
        RESULT=$base
    fi
}

parse_unary() {
    local t=${tokens[pos]:-}
    pos=$((pos + 1))
    case $t in
        -) parse_unary; RESULT=$((-RESULT)) ;;
        '(') parse_expr
             peek; [[ $PEEK == ')' ]] || fail "expected ')'"
             pos=$((pos + 1)) ;;
        [0-9]*) RESULT=$t ;;
        [A-Za-z_]*) [[ -n ${vars[$t]:-} ]] || fail "unknown variable $t"; RESULT=${vars[$t]} ;;
        '') fail "unexpected end of input" ;;
        *) fail "unexpected '$t'" ;;
    esac
}

evaluate() {
    tokenize "$1"
    parse_expr
    ((pos == ${#tokens[@]})) || fail "trailing input '${tokens[pos]}'"
    echo "$RESULT"
}

for e in '1 + 2 * 3' '(1 + 2) * 3' '2 ^ 3 ^ 2' '-x^2 + 4 * y' '17 % 5 - -3' '7 / (3 - 3)' '(1 + 2' 'z * 2'; do
    printf '%-14s => %s\n' "$e" "$( (evaluate "$e") || true)"
done
