# Tetrahedral numbers: n(n+1)(n+2)/6.
BEGIN {
    for (n = 1; n <= 10; n++) printf "%d ", n * (n + 1) * (n + 2) / 6
    printf "\n"
}
