#!/usr/bin/awk -f
# Invert key->value into value->key
BEGIN {
    m["one"] = 1; m["two"] = 2; m["three"] = 3
    for (k in m) inv[m[k]] = k
    for (i = 1; i <= 3; i++) print i, inv[i]
}
