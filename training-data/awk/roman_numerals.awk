#!/usr/bin/awk -f
function to_roman(n,    i, out) {
    split("1000 900 500 400 100 90 50 40 10 9 5 4 1", val, " ")
    split("M CM D CD C XC L XL X IX V IV I", sym, " ")
    out = ""
    for (i = 1; i <= 13; i++)
        while (n >= val[i]) {
            out = out sym[i]
            n -= val[i]
        }
    return out
}
BEGIN {
    print to_roman(4)
    print to_roman(1994)
    print to_roman(2024)
}
