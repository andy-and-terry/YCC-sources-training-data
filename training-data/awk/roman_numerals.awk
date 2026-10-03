#!/usr/bin/awk -f
function to_roman(n,    vals, syms, i, roman) {
    split("1000 900 500 400 100 90 50 40 10 9 5 4 1", vals, " ")
    split("M CM D CD C XC L XL X IX V IV I", syms, " ")
    roman = ""
    for (i = 1; i <= 13; i++) {
        while (n >= vals[i]) {
            roman = roman syms[i]
            n -= vals[i]
        }
    }
    return roman
}
BEGIN {
    print to_roman(1994)
    print to_roman(58)
    print to_roman(3999)
}
