#!/usr/bin/awk -f
BEGIN {
    srand(42)
    for (i = 0; i < 3; i++)
        printf "%d\n", int(rand() * 100) >= 0
}
