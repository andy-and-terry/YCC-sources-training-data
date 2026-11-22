# Euler zigzag numbers via the Seidel-Entringer boustrophedon.
BEGIN {
    len = 1; row[0] = 1
    printf "1 "
    for (i = 0; i < 9; i++) {
        nxt[0] = 0
        for (j = len - 1; j >= 0; j--) nxt[len - j] = nxt[len - j - 1] + row[j]
        len++
        for (j = 0; j < len; j++) row[j] = nxt[j]
        printf "%d ", row[len - 1]
    }
    print ""
}
