#!/usr/bin/awk -f
function join(arr, n, sep,   i, s) {
    s = arr[1]
    for (i = 2; i <= n; i++) s = s sep arr[i]
    return s
}
BEGIN {
    n = split("red green blue", c, " ")
    print join(c, n, ", ")
    print join(c, n, "|")
}
