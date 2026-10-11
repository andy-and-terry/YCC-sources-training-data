#!/usr/bin/awk -f
# Bucket numbers in column 1 into ranges of 10
{ b = int($1 / 10); count[b]++; if (b > max) max = b }
END {
    for (b = 0; b <= max; b++) {
        bar = ""
        for (i = 0; i < count[b]; i++) bar = bar "#"
        printf "%3d-%-3d | %s\n", b * 10, b * 10 + 9, bar
    }
}
