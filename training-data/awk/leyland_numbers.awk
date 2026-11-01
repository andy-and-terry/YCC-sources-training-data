# Leyland numbers: x^y + y^x for x >= y >= 2.
BEGIN {
    for (x = 2; x <= 4; x++)
        for (y = 2; y <= x; y++)
            printf "%d ", x ^ y + y ^ x
    print ""
}
