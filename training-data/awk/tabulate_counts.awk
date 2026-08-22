#!/usr/bin/awk -f
# Counts occurrences of the first field value.
{
    counts[$1]++
}
END {
    for (key in counts) {
        print key, counts[key]
    }
}
