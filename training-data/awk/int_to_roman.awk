# Integer (1..3999) to Roman numeral using a greedy table.
function to_roman(n,    i, out) {
    for (i = 1; i <= 13; i++)
        while (n >= value[i]) {
            out = out symbol[i]
            n -= value[i]
        }
    return out
}

BEGIN {
    split("1000 900 500 400 100 90 50 40 10 9 5 4 1", value, " ")
    split("M CM D CD C XC L XL X IX V IV I", symbol, " ")
    print to_roman(1994), to_roman(58)
}
