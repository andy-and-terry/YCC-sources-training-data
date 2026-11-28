#!/usr/bin/awk -f
BEGIN {
    na = split("1 2 3 4", a, " "); nb = split("3 4 5", b, " ")
    for (i = 1; i <= na; i++) { inA[a[i]] = 1; all[a[i]] = 1 }
    for (i = 1; i <= nb; i++) { inB[b[i]] = 1; all[b[i]] = 1 }
    for (k in all) { u++; if ((k in inA) && (k in inB)) inter++ }
    printf "%.2f\n", inter / u
}
