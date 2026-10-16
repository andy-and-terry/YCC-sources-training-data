#!/usr/bin/awk -f
function digital_root(n,   s) {
    while (n >= 10) {
        s = 0
        while (n > 0) { s += n % 10; n = int(n / 10) }
        n = s
    }
    return n
}
BEGIN {
    print digital_root(942)
    print digital_root(132189)
    print digital_root(7)
}
