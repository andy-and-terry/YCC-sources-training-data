#!/usr/bin/awk -f
# Finds the second-largest value in the first field across all input lines.
BEGIN {
    largest = -2147483648
    second = -2147483648
}
{
    if ($1 > largest) {
        second = largest
        largest = $1
    } else if ($1 > second && $1 < largest) {
        second = $1
    }
}
END {
    print second
}
