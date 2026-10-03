#!/usr/bin/awk -f
BEGIN {
    n = 27
    steps = 0
    printf "%d", n
    while (n != 1) {
        if (n % 2 == 0) n = n / 2
        else n = 3 * n + 1
        steps++
        printf " %d", n
    }
    print ""
    print "steps:", steps
}
