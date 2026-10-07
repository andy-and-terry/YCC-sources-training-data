#!/usr/bin/awk -f
# Prints lines in the first file that do not appear in the second file (set difference).
FNR == NR {
    order[++n] = $0
    first[$0] = 1
    next
}
{
    second[$0] = 1
}
END {
    for (i = 1; i <= n; i++) {
        if (!(order[i] in second)) print order[i]
    }
}
