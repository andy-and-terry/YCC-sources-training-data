#!/usr/bin/awk -f
# Prints a bar-chart histogram of word lengths across all input lines.
{
    for (i = 1; i <= NF; i++) {
        counts[length($i)]++
    }
}
END {
    for (len in counts) {
        printf "%d: ", len
        for (i = 0; i < counts[len]; i++) printf "*"
        print ""
    }
}
