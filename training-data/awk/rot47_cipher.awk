BEGIN {
    for (i = 33; i <= 126; i++) ord[sprintf("%c", i)] = i
    s = "Hello, World!"
    out = ""
    for (i = 1; i <= length(s); i++) {
        c = substr(s, i, 1)
        n = ord[c]
        out = out (n ? sprintf("%c", 33 + (n - 33 + 47) % 94) : c)
    }
    print out
}
