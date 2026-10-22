# Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
# Run: awk -f perrin_numbers.awk
BEGIN {
    p[0] = 3; p[1] = 0; p[2] = 2
    for (n = 3; n < 15; n++) p[n] = p[n - 2] + p[n - 3]
    for (n = 0; n < 15; n++) printf "%d%s", p[n], (n < 14 ? " " : "\n")
}
