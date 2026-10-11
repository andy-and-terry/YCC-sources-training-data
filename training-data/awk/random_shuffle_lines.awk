#!/usr/bin/awk -f
# Fisher-Yates shuffle of input lines
BEGIN { srand(42) }
{ a[NR] = $0 }
END {
    for (i = NR; i > 1; i--) {
        j = int(rand() * i) + 1
        t = a[i]; a[i] = a[j]; a[j] = t
    }
    for (i = 1; i <= NR; i++) print a[i]
}
