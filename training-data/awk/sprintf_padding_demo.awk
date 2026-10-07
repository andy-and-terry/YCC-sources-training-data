#!/usr/bin/awk -f
# Formatting with sprintf: zero padding, widths from variables, alignment and precision.
BEGIN {
    id = sprintf("%05d", 42)
    print id

    width = 12
    printf "[%*s]\n", width, "right"
    printf "[%-*s]\n", width, "left"
    printf "[%.3s]\n", "truncate"
    printf "[%8.3f]\n", 3.14159265
    printf "[%+d] [% d]\n", 7, 7
    printf "[%x] [%X] [%o]\n", 255, 255, 8
    printf "[%e]\n", 12345.678
    printf "[%c%c%c]\n", 65, "B", 67
    printf "%5.1f%%\n", 45.678

    line = sprintf("%-10s|%6s|", "name", "qty")
    print line
    gsub(/[^|]/, "-", line)
    print line
}
