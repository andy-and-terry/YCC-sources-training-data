function is_pronic(x,    n) {
    n = int(sqrt(x))
    return n * (n + 1) == x
}

BEGIN {
    for (n = 0; n < 10; n++) printf "%d ", n * (n + 1)
    print "" # 0 2 6 12 20 30 42 56 72 90
    print is_pronic(56), is_pronic(57) # 1 0
}
