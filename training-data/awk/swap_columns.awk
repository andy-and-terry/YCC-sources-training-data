#!/usr/bin/awk -f
# Swaps the first two fields on each line.
{
    temp = $1
    $1 = $2
    $2 = temp
    print
}
