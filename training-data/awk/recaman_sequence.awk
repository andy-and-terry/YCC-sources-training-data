#!/usr/bin/awk -f
BEGIN {
    seq[0] = 0
    seen[0] = 1
    out = "0"
    for (n = 1; n < 20; n++) {
        next_val = seq[n - 1] - n
        if (next_val <= 0 || (next_val in seen))
            next_val = seq[n - 1] + n
        seen[next_val] = 1
        seq[n] = next_val
        out = out " " next_val
    }
    print out
}
