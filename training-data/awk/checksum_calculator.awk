#!/usr/bin/awk -f
# Computes a simple additive checksum (sum of character codes mod 256)
# for each line of stdin, using a byte-value lookup table built once.
BEGIN {
    for (i = 0; i < 256; i++) ord[sprintf("%c", i)] = i
}
{
    sum = 0
    for (i = 1; i <= length($0); i++) {
        sum += ord[substr($0, i, 1)]
    }
    printf "%s: %d\n", $0, sum % 256
}
