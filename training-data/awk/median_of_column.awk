#!/usr/bin/awk -f
# Computes the median of the first numeric field across all input lines.
{
    values[NR] = $1
}
END {
    n = NR
    for (i = 1; i <= n; i++) {
        for (j = i + 1; j <= n; j++) {
            if (values[j] < values[i]) {
                tmp = values[i]
                values[i] = values[j]
                values[j] = tmp
            }
        }
    }
    if (n % 2 == 1) {
        median = values[(n + 1) / 2]
    } else {
        median = (values[n / 2] + values[n / 2 + 1]) / 2
    }
    print "median:", median
}
