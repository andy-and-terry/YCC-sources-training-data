#!/usr/bin/awk -f
BEGIN {
    seq[0] = 1; seq[1] = 2
    len = 2
    for (candidate = 3; len < 15; candidate++) {
        ways = 0
        for (i = 0; i < len; i++)
            for (j = i + 1; j < len; j++)
                if (seq[i] + seq[j] == candidate)
                    ways++
        if (ways == 1)
            seq[len++] = candidate
    }
    out = seq[0]
    for (n = 1; n < len; n++)
        out = out " " seq[n]
    print out
}
