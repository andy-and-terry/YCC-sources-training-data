#!/usr/bin/awk -f
# Converts each input integer to its Roman numeral representation.
BEGIN {
    split("1000 900 500 400 100 90 50 40 10 9 5 4 1", values, " ")
    split("M CM D CD C XC L XL X IX V IV I", symbols, " ")
}
{
    n = $1
    result = ""
    for (k = 1; k <= 13; k++) {
        while (n >= values[k]) {
            result = result symbols[k]
            n -= values[k]
        }
    }
    print result
}
