#!/usr/bin/awk -f
# Computes the average of the values in the second column.
{
    total += $2
    count++
}
END {
    if (count > 0) {
        print "Average:", total / count
    }
}
