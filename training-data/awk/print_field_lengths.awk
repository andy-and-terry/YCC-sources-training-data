#!/usr/bin/awk -f
{
    for (i = 1; i <= NF; i++) {
        printf "%s(%d) ", $i, length($i)
    }
    print ""
}
