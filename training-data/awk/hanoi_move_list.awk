function hanoi(n, a, b, c) {
    if (n == 0) return
    hanoi(n - 1, a, c, b)
    printf "%s->%s ", a, c
    moves++
    hanoi(n - 1, b, a, c)
}
BEGIN {
    hanoi(3, "A", "B", "C")
    printf "\n%d moves\n", moves
}
