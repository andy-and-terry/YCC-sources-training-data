# Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
BEGIN {
    for (n = 0; n < 10; n++) printf "%d ", n * (n + 1) / 2 + 1
    print ""
}
