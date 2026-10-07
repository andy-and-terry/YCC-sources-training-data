#!/usr/bin/awk -f
# Demonstrates printf numeric format specifiers: width, precision, hex, octal, and
# scientific notation.
BEGIN {
    printf "%d\n", 42
    printf "%5d|\n", 42
    printf "%-5d|\n", 42
    printf "%05.2f\n", 3.14159
    printf "%x\n", 255
    printf "%o\n", 8
    printf "%e\n", 123456.789
}
