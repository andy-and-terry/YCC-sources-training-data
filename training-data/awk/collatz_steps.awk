#!/usr/bin/awk -f
# Reads one positive integer per line and prints its Collatz step count.
{
    n = $1 + 0
    if (n < 1) next
    steps = 0
    while (n != 1) {
        n = (n % 2 == 0) ? n / 2 : 3 * n + 1
        steps++
    }
    print $1 ": " steps " steps"
}
