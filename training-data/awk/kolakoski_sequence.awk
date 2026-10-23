#!/usr/bin/awk -f
BEGIN {
    seq[0] = 1; seq[1] = 2; seq[2] = 2
    len = 3
    for (i = 2; len < 20; i++) {
        value = (i % 2 == 0) ? 1 : 2
        for (k = 0; k < seq[i]; k++)
            seq[len++] = value
    }
    out = seq[0]
    for (n = 1; n < 20; n++)
        out = out " " seq[n]
    print out
}
