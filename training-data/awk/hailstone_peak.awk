# Highest value reached by the Collatz (hailstone) sequence from n.
function peak(n,    best) {
    best = n
    while (n != 1) {
        n = (n % 2 == 0) ? n / 2 : 3 * n + 1
        if (n > best) best = n
    }
    return best
}

BEGIN { print peak(27) }
