#!/usr/bin/awk -f
# Report lines where the same value appears twice in a row of fields
{
    delete seen
    for (i = 1; i <= NF; i++) {
        if (seen[$i]++) { printf "line %d repeats \"%s\"\n", NR, $i; break }
    }
}
