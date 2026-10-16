#!/usr/bin/awk -f
BEGIN {
    n = 5
    for (i = 1; i <= n; i++) {
        pad = sprintf("%" (n - i) "s", "")
        stars = ""
        for (j = 1; j <= 2 * i - 1; j++) stars = stars "*"
        print pad stars
    }
}
