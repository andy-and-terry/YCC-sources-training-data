#!/usr/bin/awk -f
# Tracks the running maximum and minimum of the first field.
NR == 1 { max = min = $1 }
{
    if ($1 > max) max = $1
    if ($1 < min) min = $1
    printf "%d: value=%s max=%s min=%s\n", NR, $1, max, min
}
