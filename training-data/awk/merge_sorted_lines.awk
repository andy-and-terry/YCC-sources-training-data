#!/usr/bin/awk -f
# Merges two pre-sorted files of numbers (given as arguments) into one sorted stream.
FNR == NR {
    a[++na] = $1
    next
}
{
    b[++nb] = $1
}
END {
    i = 1; j = 1
    while (i <= na && j <= nb) {
        if (a[i] <= b[j]) {
            print a[i]
            i++
        } else {
            print b[j]
            j++
        }
    }
    while (i <= na) { print a[i]; i++ }
    while (j <= nb) { print b[j]; j++ }
}
