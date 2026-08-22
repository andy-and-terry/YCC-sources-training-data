#!/usr/bin/awk -f
# Joins all input lines with a comma.
{
    if (NR > 1) printf ","
    printf "%s", $0
}
END {
    print ""
}
