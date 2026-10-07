#!/usr/bin/awk -f
# Recursive functions: power by squaring and string reversal.
function power(b, e,    half) {
    if (e == 0) return 1
    half = power(b, int(e / 2))
    return (e % 2) ? half * half * b : half * half
}
function rev(s) {
    if (length(s) <= 1) return s
    return rev(substr(s, 2)) substr(s, 1, 1)
}
BEGIN {
    print power(3, 13)
    print rev("recursion")
}
