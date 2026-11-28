#!/usr/bin/awk -f
BEGIN {
    text = "WEAREDISCOVERED"; k = 3; cycle = 2 * (k - 1)
    for (i = 0; i < length(text); i++) {
        r = i % cycle; rail = (r < k) ? r : cycle - r
        rails[rail] = rails[rail] substr(text, i + 1, 1)
    }
    for (r = 0; r < k; r++) out = out rails[r]
    print out
}
