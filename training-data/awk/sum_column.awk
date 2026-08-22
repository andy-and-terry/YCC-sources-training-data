#!/usr/bin/awk -f
# Sums the values in the first column of the input.
{
    total += $1
}
END {
    print "Total:", total
}
