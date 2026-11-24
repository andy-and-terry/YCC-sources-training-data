# Centered square numbers: n^2 + (n+1)^2.
BEGIN {
    for (n = 0; n < 10; n++) printf "%d ", n * n + (n + 1) * (n + 1)
    printf "\n"
}
