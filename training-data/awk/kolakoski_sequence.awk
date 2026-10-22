#!/usr/bin/awk -f
BEGIN {
    seq[0] = 1; seq[1] = 2; seq[2] = 2
    len = 3
    for (i = 2; len < 20; i++) {
        value = 3 - seq[len - 1]
        for (k = 0; k < seq[i]; k++)
            seq[len++] = value
    }
    out = seq[0]
    for (j = 1; j < 20; j++)
        out = out " " seq[j]
    print out
}
