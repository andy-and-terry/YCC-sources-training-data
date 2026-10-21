# Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
# run: awk -f jacobsthal_numbers.awk
BEGIN {
    a = 0; b = 1
    for (i = 0; i < 15; i++) {
        printf "%d%s", a, (i < 14 ? " " : "\n")
        t = b + 2 * a
        a = b
        b = t
    }
}
