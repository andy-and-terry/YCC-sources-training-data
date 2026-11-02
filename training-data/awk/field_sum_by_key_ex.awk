BEGIN { FS = "," }
{ total[$1] += $2 }
END { for (k in total) printf "%s %d\n", k, total[k] }
