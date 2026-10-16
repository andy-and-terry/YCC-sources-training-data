#!/usr/bin/awk -f
{ a[NR] = $1 }
END {
    for (i = 1; i < NR; i++)
        for (j = 1; j <= NR - i; j++)
            if (a[j] < a[j+1]) { t = a[j]; a[j] = a[j+1]; a[j+1] = t }
    for (i = 1; i <= NR; i++) print a[i]
}
