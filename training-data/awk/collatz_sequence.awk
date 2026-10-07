#!/usr/bin/awk -f
function collatz(n,    steps, seq) {
    seq = n
    while (n != 1) {
        n = (n % 2 == 0) ? n / 2 : 3 * n + 1
        seq = seq " " n
        steps++
    }
    return seq " (steps: " steps ")"
}
BEGIN {
    print collatz(6)
    print collatz(7)
}
