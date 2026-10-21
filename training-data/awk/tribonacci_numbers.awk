# Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
BEGIN {
    a = 0; b = 0; c = 1
    printf "Tribonacci:"
    for (i = 0; i < 15; i++) {
        printf " %d", a
        next_term = a + b + c
        a = b; b = c; c = next_term
    }
    printf "\n"
}
