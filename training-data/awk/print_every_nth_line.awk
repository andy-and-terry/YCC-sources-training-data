#!/usr/bin/awk -f
# Prints every 3rd input line.
NR % 3 == 0 {
    print
}
