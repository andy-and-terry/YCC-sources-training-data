#!/usr/bin/awk -f
# Usage: awk -v field=2 -v lo=10 -v hi=20 -f field_value_range_filter.awk file
BEGIN {
    if (field == "") field = 1
    if (lo == "") lo = 0
    if (hi == "") hi = 100
}
$field + 0 >= lo && $field + 0 <= hi {
    print
    kept++
}
END {
    printf "kept %d of %d lines\n", kept + 0, NR > "/dev/stderr"
}
