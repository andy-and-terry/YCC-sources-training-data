#!/usr/bin/awk -f
function hanoi(n, from, to, via) {
    if (n == 0) return
    hanoi(n - 1, from, via, to)
    print "move disk " n " from " from " to " to
    moves++
    hanoi(n - 1, via, to, from)
}
BEGIN {
    hanoi(3, "A", "C", "B")
    print "total moves: " moves
}
