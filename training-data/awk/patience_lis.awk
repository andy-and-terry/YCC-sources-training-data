# longest increasing subsequence length via tails + binary search
BEGIN {
    n = split("10 9 2 5 3 7 101 18", a, " ")
    len = 0
    for (i = 1; i <= n; i++) {
        lo = 1; hi = len + 1
        while (lo < hi) {
            mid = int((lo + hi) / 2)
            if (tails[mid] < a[i]) lo = mid + 1; else hi = mid
        }
        tails[lo] = a[i]
        if (lo > len) len = lo
    }
    print len
}
