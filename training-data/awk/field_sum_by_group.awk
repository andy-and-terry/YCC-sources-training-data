#!/usr/bin/awk -f
# Sums the second field, grouped by the first field.
{
    totals[$1] += $2
}
END {
    for (key in totals) {
        print key, totals[key]
    }
}
