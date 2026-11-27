function encode(text, rails,    i, r, step, rows, out) {
    r = 1; step = 1
    for (i = 1; i <= length(text); i++) {
        rows[r] = rows[r] substr(text, i, 1)
        if (r == 1) step = 1
        else if (r == rails) step = -1
        r += step
    }
    for (r = 1; r <= rails; r++) out = out rows[r]
    return out
}
BEGIN { print encode("WEAREDISCOVERED", 3) }
