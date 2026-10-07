#!/usr/bin/awk -f
function kadane(a, n,    i, best, current) {
    best = a[1]
    current = a[1]
    for (i = 2; i <= n; i++) {
        current = (current + a[i] > a[i]) ? current + a[i] : a[i]
        if (current > best) best = current
    }
    return best
}
BEGIN {
    split("-2 1 -3 4 -1 2 1 -5 4", arr, " ")
    print kadane(arr, 9)
}
