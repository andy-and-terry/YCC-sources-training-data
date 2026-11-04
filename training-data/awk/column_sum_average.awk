# Sum and average of each numeric column.
{
    for (i = 1; i <= NF; i++) sum[i] += $i
    if (NF > maxnf) maxnf = NF
}
END {
    for (i = 1; i <= maxnf; i++)
        printf "col %d: sum=%g avg=%.2f\n", i, sum[i], sum[i] / NR
}
# try: printf '1 2\n3 4\n5 6\n' | awk -f column_sum_average.awk
