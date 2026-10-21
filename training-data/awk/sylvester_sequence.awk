# Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
# awk numbers are doubles, so only the first 6 terms are exact.
BEGIN {
    s = 2
    for (i = 0; i < 6; i++) {
        printf "s(%d) = %d\n", i, s
        s = s * s - s + 1
    }
}
