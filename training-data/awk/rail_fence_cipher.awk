BEGIN {
    s = "WEAREDISCOVERED"; rails = 3; r = 0; dir = 1
    for (i = 1; i <= length(s); i++) {
        row[r] = row[r] substr(s, i, 1)
        if (r == 0) dir = 1
        if (r == rails - 1) dir = -1
        r += dir
    }
    for (k = 0; k < rails; k++) printf "%s", row[k]
    print ""
}
