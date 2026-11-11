# Repunits: numbers made only of the digit 1.
BEGIN {
    r = 0
    for (i = 1; i <= 5; i++) {
        r = r * 10 + 1
        printf "%d ", r
    }
    print ""
}
