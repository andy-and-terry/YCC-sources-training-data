#!/usr/bin/awk -f
BEGIN {
    seq[0] = 1; seq[1] = 2
    in_seq[1] = 1; in_seq[2] = 1
    len = 2
    for (n = 3; len < 15; n++) {
        ways = 0
        for (i = 0; i < len; i++) {
            b = n - seq[i]
            if (b > seq[i] && (b in in_seq))
                ways++
        }
        if (ways == 1) {
            seq[len++] = n
            in_seq[n] = 1
        }
    }
    out = seq[0]
    for (j = 1; j < len; j++)
        out = out " " seq[j]
    print out
}
