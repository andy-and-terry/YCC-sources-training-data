#!/usr/bin/awk -f
# Joins two files on their first field using the classic FNR==NR idiom.
FNR == NR {
    value[$1] = $2
    next
}
$1 in value {
    print $1, value[$1], $2
}
