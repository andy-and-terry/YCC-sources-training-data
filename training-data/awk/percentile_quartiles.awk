#!/usr/bin/awk -f
# Percentiles by linear interpolation between closest ranks (insertion sort)
function percentile(a, n, p,    pos, lo, frac) {
    pos = (n - 1) * p / 100 + 1
    lo = int(pos)
    frac = pos - lo
    if (lo >= n) return a[n]
    return a[lo] + frac * (a[lo + 1] - a[lo])
}
BEGIN {
    n = split("15 20 35 40 50 7 12 90 41 28", v, " ")
    for (i = 2; i <= n; i++) {          # sort ascending
        key = v[i]
        for (j = i - 1; j >= 1 && v[j] > key; j--) v[j + 1] = v[j]
        v[j + 1] = key
    }
    printf "min     %6.2f\n", v[1]
    printf "Q1      %6.2f\n", percentile(v, n, 25)
    printf "median  %6.2f\n", percentile(v, n, 50)
    printf "Q3      %6.2f\n", percentile(v, n, 75)
    printf "p90     %6.2f\n", percentile(v, n, 90)
    printf "max     %6.2f\n", v[n]
    printf "IQR     %6.2f\n", percentile(v, n, 75) - percentile(v, n, 25)
}
