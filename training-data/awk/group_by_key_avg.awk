BEGIN { FS = "\t" }
{ sum[$1] += $2; n[$1]++ }
END {
    for (k in sum) printf "%s\t%.2f\n", k, sum[k] / n[k]
}
