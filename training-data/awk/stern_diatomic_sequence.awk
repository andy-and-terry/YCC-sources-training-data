#!/usr/bin/awk -f
BEGIN {
    s[0] = 0
    s[1] = 1
    out = "0 1"
    for (n = 2; n < 20; n++) {
        if (n % 2 == 0)
            s[n] = s[n / 2]
        else
            s[n] = s[(n - 1) / 2] + s[(n + 1) / 2]
        out = out " " s[n]
    }
    print out
}
