#!/usr/bin/awk -f
# Converts each input binary string to its decimal value.
{
    bits = $1
    n = length(bits)
    decimal = 0
    for (i = 1; i <= n; i++) {
        decimal = decimal * 2 + substr(bits, i, 1)
    }
    print decimal
}
