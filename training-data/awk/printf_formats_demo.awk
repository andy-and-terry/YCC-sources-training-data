#!/usr/bin/awk -f
BEGIN {
    printf "%5d|%-5d|%05d\n", 42, 42, 42
    printf "%8.3f|%-8.2f|%e\n", 3.14159, 2.5, 12345.678
    printf "%s|%10s|%-10s|%.3s\n", "abc", "right", "left", "truncate"
    printf "%x %X %o %c %c\n", 255, 255, 8, 65, "hello"
    printf "%5.1f%%\n", 99.5
    printf "%*d\n", 6, 7
}
