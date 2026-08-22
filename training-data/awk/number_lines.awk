#!/usr/bin/awk -f
# Prefixes each line with its line number, right-aligned like cat -n.
{
    printf "%6d\t%s\n", NR, $0
}
