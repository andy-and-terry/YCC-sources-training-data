function column_title(n,    out) {
    out = ""
    while (n > 0) {
        n--
        out = substr("ABCDEFGHIJKLMNOPQRSTUVWXYZ", n % 26 + 1, 1) out
        n = int(n / 26)
    }
    return out
}
BEGIN { print column_title(28), column_title(701) }   # AB ZY
