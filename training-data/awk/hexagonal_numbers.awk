# Hexagonal numbers: n(2n-1).
BEGIN {
    for (n = 1; n <= 10; n++) printf "%d ", n * (2 * n - 1)
    printf "\n"
}
