BEGIN { FS = "," }
{ sum[$1] += $2 }
END { for (k in sum) print k, sum[k] }
