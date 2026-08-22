#!/usr/bin/awk -f
function gcd(a, b) {
    while (b != 0) {
        t = b
        b = a % b
        a = t
    }
    return a
}
BEGIN {
    print gcd(48, 18)
    print gcd(100, 75)
}
