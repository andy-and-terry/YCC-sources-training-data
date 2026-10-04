#!/usr/bin/awk -f
# Common printf format specifiers.
BEGIN {
    printf "%5d|%-5d|%05d\n", 42, 42, 42
    printf "%8.3f|%e\n", 3.14159265, 12345.678
    printf "%x %X %o %c\n", 255, 255, 8, 65
    printf "%10s|%-10s|%.3s\n", "right", "left", "truncate"
    printf "%*d\n", 6, 7
    printf "100%%\n"
}
