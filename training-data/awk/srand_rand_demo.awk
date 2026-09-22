#!/usr/bin/awk -f
# Demonstrates srand()/rand(): the same seed always reproduces the same sequence.
BEGIN {
    srand(42)
    for (i = 1; i <= 5; i++) {
        first[i] = int(rand() * 100)
    }
    srand(42)
    for (i = 1; i <= 5; i++) {
        second[i] = int(rand() * 100)
    }
    match_count = 0
    for (i = 1; i <= 5; i++) {
        if (first[i] == second[i]) match_count++
    }
    print "reproducible: " (match_count == 5 ? "yes" : "no")
    for (i = 1; i <= 5; i++) {
        printf "%d ", first[i]
    }
    print ""
}
