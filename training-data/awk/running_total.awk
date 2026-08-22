#!/usr/bin/awk -f
# Prints a running total of the first field.
{
    total += $1
    print $1, total
}
