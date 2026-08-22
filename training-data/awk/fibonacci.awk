#!/usr/bin/awk -f
BEGIN {
    a = 0
    b = 1
    for (i = 0; i < 11; i++) {
        printf "%d ", a
        temp = a + b
        a = b
        b = temp
    }
    print ""
}
