#!/usr/bin/awk -f
# Prints a simple bar-chart histogram of the first field.
{
    printf "%s: ", $1
    for (i = 0; i < $2; i++) printf "*"
    print ""
}
