#!/usr/bin/awk -f
{
    for (i = NF; i >= 1; i--) {
        printf "%s%s", $i, (i > 1 ? " " : "\n")
    }
}
