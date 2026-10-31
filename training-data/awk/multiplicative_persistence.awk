function persistence(n,    steps, product, i) {
    while (n >= 10) {
        product = 1
        for (i = 1; i <= length(n); i++) product *= substr(n, i, 1)
        n = product
        steps++
    }
    return steps + 0
}
BEGIN {
    split("39 77 999 10", values, " ")
    for (i = 1; i <= 4; i++) print values[i], persistence(values[i])
}
