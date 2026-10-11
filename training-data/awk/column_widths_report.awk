#!/usr/bin/awk -F, -f
# Report the max width of every column, then print an aligned table
{
    for (i = 1; i <= NF; i++) {
        if (length($i) > w[i]) w[i] = length($i)
        cell[NR, i] = $i
    }
    if (NF > nf) nf = NF
}
END {
    for (r = 1; r <= NR; r++) {
        line = ""
        for (i = 1; i <= nf; i++) line = line sprintf("%-" w[i] "s  ", cell[r, i])
        print line
    }
}
