#!/usr/bin/awk -f
# Treat commas as record separators instead of newlines.
# Usage: printf 'apple,banana,cherry' | awk -f rs_custom_separator.awk
BEGIN {
    RS = ","
}
{
    gsub(/\n/, "")   # drop the trailing newline attached to the last record
    printf "%d: %s\n", NR, $0
}
END {
    print "records:", NR
}
