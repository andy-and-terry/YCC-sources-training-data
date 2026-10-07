#!/usr/bin/awk -f
function is_armstrong(n,    digits, temp, sum, d, p, i) {
    digits = length(n)
    temp = n
    sum = 0
    while (temp > 0) {
        d = temp % 10
        p = 1
        for (i = 0; i < digits; i++) p *= d
        sum += p
        temp = int(temp / 10)
    }
    return sum == n
}
BEGIN {
    for (n = 1; n <= 1000; n++) {
        if (is_armstrong(n)) printf "%d ", n
    }
    print ""
}
