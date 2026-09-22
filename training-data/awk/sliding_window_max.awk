#!/usr/bin/awk -f
# Prints the maximum value in each sliding window of size k over the input numbers.
BEGIN {
    k = 3
}
{
    values[NR] = $1
}
END {
    for (i = 1; i <= NR - k + 1; i++) {
        max = values[i]
        for (j = i; j < i + k; j++) {
            if (values[j] > max) max = values[j]
        }
        print max
    }
}
