#!/usr/bin/awk -f
# Compares two files line by line and reports differing lines.
FNR == NR {
    first[FNR] = $0
    next
}
{
    if ($0 != first[FNR]) {
        print "line " FNR ": " first[FNR] " <> " $0
    }
}
