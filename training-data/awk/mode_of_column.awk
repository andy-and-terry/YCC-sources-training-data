#!/usr/bin/awk -f
# Computes the most frequently occurring value in the first field.
{
    counts[$1]++
}
END {
    best_count = 0
    for (value in counts) {
        if (counts[value] > best_count) {
            best_count = counts[value]
            best_value = value
        }
    }
    print "mode:", best_value, "count:", best_count
}
