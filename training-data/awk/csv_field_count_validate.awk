#!/usr/bin/awk -f
# Flags CSV data rows whose field count differs from the header row.
BEGIN {
    FS = ","
}
NR == 1 {
    expected = NF
    next
}
{
    if (NF != expected) {
        print "line " NR ": expected " expected " fields, got " NF
    }
}
