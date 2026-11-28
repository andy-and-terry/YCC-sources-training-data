BEGIN {
    s = "banana$"; n = length(s)
    for (i = 0; i < n; i++) rot[i] = substr(s, i + 1) substr(s, 1, i)
    for (i = 1; i < n; i++) {
        v = rot[i]; j = i - 1
        while (j >= 0 && rot[j] > v) { rot[j + 1] = rot[j]; j-- }
        rot[j + 1] = v
    }
    out = ""
    for (i = 0; i < n; i++) out = out substr(rot[i], n, 1)
    print out
}
