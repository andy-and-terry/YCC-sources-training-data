#!/usr/bin/awk -f
# Computes the population standard deviation of the first field across all input lines.
{
    values[NR] = $1
    sum += $1
}
END {
    n = NR
    mean = sum / n
    for (i = 1; i <= n; i++) {
        diff = values[i] - mean
        sq_sum += diff * diff
    }
    print "stddev:", sqrt(sq_sum / n)
}
