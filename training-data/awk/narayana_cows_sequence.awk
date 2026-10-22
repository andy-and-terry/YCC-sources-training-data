# Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
BEGIN {
    n[0] = n[1] = n[2] = 1
    for (i = 3; i < 15; i++) n[i] = n[i - 1] + n[i - 3]
    for (i = 0; i < 15; i++) printf "%d%s", n[i], (i < 14 ? " " : "\n")
}
