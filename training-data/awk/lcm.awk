#!/usr/bin/awk -f
# Computes the least common multiple of two numbers via their greatest common divisor.
function gcd(a, b) {
    while (b != 0) {
        t = b
        b = a % b
        a = t
    }
    return a
}
function lcm(a, b) {
    return a / gcd(a, b) * b
}
BEGIN {
    print lcm(4, 6)
    print lcm(21, 6)
}
