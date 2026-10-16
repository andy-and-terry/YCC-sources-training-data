#!/usr/bin/awk -f
function luhn(s,   i, d, sum, alt) {
    for (i = length(s); i >= 1; i--) {
        d = substr(s, i, 1) + 0
        if (alt) { d *= 2; if (d > 9) d -= 9 }
        sum += d
        alt = !alt
    }
    return sum % 10 == 0
}
BEGIN {
    print luhn("4539578763621486")
    print luhn("1234567812345678")
}
