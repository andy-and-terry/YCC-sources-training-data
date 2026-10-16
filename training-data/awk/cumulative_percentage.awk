#!/usr/bin/awk -f
# Input: label value. Prints cumulative percentage.
{ lab[NR] = $1; val[NR] = $2; total += $2 }
END {
    for (i = 1; i <= NR; i++) {
        cum += val[i]
        printf "%-8s %6d %6.1f%%\n", lab[i], val[i], 100 * cum / total
    }
}
