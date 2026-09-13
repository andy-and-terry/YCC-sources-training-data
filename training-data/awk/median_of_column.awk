#!/usr/bin/awk -f
# Computes the median value of the first field across all input lines.
{
    values[NR] = $1
}
END {
    n = NR
    for (i = 1; i < n; i++) {
        for (j = 1; j <= n - i; j++) {
            if (values[j] > values[j + 1]) {
                temp = values[j]
                values[j] = values[j + 1]
                values[j + 1] = temp
            }
        }
    }
    if (n % 2 == 1) {
        print values[(n + 1) / 2]
    } else {
        print (values[n / 2] + values[n / 2 + 1]) / 2
    }
}
