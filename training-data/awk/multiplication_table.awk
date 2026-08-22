#!/usr/bin/awk -f
BEGIN {
    for (i = 1; i <= 5; i++) {
        for (j = 1; j <= 5; j++) {
            printf "%d ", i * j
        }
        print ""
    }
}
