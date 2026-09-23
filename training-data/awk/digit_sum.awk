#!/usr/bin/awk -f
# Sums the digits of each input number.
{
    n = $1
    if (n < 0) n = -n
    sum = 0
    while (n > 0) {
        sum += n % 10
        n = int(n / 10)
    }
    print sum
}
