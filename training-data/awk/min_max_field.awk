#!/usr/bin/awk -f
# Tracks the min and max of the first field across input lines.
BEGIN { first = 1 }
{
    if (first || $1 < min) min = $1
    if (first || $1 > max) max = $1
    first = 0
}
END {
    print "min:", min, "max:", max
}
