#!/usr/bin/awk -f
# Converts a hex string (optionally prefixed with 0x) in field 1 to decimal,
# without relying on the non-portable strtonum() gawk extension.
{
    hex = $1
    sub(/^0[xX]/, "", hex)
    hex = toupper(hex)
    value = 0
    for (i = 1; i <= length(hex); i++) {
        c = substr(hex, i, 1)
        pos = index("0123456789ABCDEF", c) - 1
        value = value * 16 + pos
    }
    print $1 " -> " value
}
