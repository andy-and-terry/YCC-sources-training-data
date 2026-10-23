#!/usr/bin/awk -f
BEGIN {
    seq[0] = 0
    out = "0"
    for (n = 0; n < 19; n++) {
        current = seq[n]
        next_val = (current in last_seen) ? n - last_seen[current] : 0
        last_seen[current] = n
        seq[n + 1] = next_val
        out = out " " next_val
    }
    print out
}
