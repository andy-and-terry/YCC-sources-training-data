#!/usr/bin/awk -f
# Prints a running (cumulative) average of the first field.
{
    total += $1
    count++
    printf "%s %.2f\n", $1, total / count
}
