def hanoi(int n, String a, String b, String c, List out) {
    if (n == 0) return
    hanoi(n - 1, a, c, b, out)
    out << "$a->$c".toString()
    hanoi(n - 1, b, a, c, out)
}

def moves = []
hanoi(3, 'A', 'B', 'C', moves)
println "${moves.size()}: ${moves.join(' ')}"
