#!/usr/bin/awk -f
# usage: awk -f sum_column_by_key.awk data.txt  (lines: key value)
{ sum[$1] += $2 }
END {
    for (k in sum)
        printf "%s %d\n", k, sum[k]
}
