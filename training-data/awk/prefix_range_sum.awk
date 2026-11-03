BEGIN {
    n = split("3 1 4 1 5 9 2 6", values, " ")
    prefix[0] = 0
    for (i = 1; i <= n; i++) prefix[i] = prefix[i - 1] + values[i]
    lo = 2; hi = 5
    print prefix[hi] - prefix[lo]
}
