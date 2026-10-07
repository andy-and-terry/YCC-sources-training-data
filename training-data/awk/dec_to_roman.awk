#!/usr/bin/awk -f
function to_roman(n,    i, out) {
    out = ""
    for (i = 1; i <= 13; i++) {
        while (n >= val[i]) {
            out = out sym[i]
            n -= val[i]
        }
    }
    return out
}
BEGIN {
    split("1000 900 500 400 100 90 50 40 10 9 5 4 1", val, " ")
    split("M CM D CD C XC L XL X IX V IV I", sym, " ")
}
$1 ~ /^[0-9]+$/ && $1 > 0 && $1 < 4000 { print $1, to_roman($1) }
