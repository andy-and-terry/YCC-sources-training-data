# usage: awk -f column_sum_by_key_ex.awk data.txt   (lines: key value)
{ sum[$1] += $2; n[$1]++ }
END {
  for (k in sum) printf "%s total=%d avg=%.2f\n", k, sum[k], sum[k] / n[k]
}
