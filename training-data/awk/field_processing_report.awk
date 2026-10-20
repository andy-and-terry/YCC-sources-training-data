#!/usr/bin/awk -f
BEGIN { FS = ","; printf "%-8s %5s %8s\n", "name", "qty", "total" }
NR == 1 { next }
{
    total = $2 * $3
    printf "%-8s %5d %8.2f\n", $1, $2, total
    sum += total; qty += $2
    if (total > max) { max = total; top = $1 }
}
END { printf "%-8s %5d %8.2f\n", "TOTAL", qty, sum; print "top:", top, "avg:", (NR > 1 ? sum / (NR - 1) : 0) }
