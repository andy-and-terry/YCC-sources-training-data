#!/usr/bin/awk -f
function digit_sum(n,    sum) {
    n = (n < 0) ? -n : n
    sum = 0
    while (n > 0) {
        sum += n % 10
        n = int(n / 10)
    }
    return sum
}
BEGIN {
    print digit_sum(12345)
    print digit_sum(999)
}
