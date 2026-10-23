#!/usr/bin/awk -f
# Parse fixed-width records with substr() when columns have no delimiter.
# Layout: id (1-4), name (5-14), qty (15-18), price (19-24)
BEGIN {
    data[1] = "0001Widget    0012  3.50"
    data[2] = "0002Gadget    0003 12.25"
    data[3] = "0003Doohickey 0100  0.99"

    printf "%-6s %-10s %4s %8s\n", "ID", "NAME", "QTY", "TOTAL"
    for (i = 1; i <= 3; i++) {
        rec = data[i]
        id    = substr(rec, 1, 4) + 0
        name  = substr(rec, 5, 10)
        qty   = substr(rec, 15, 4) + 0
        price = substr(rec, 19, 6) + 0
        gsub(/ +$/, "", name)
        total += qty * price
        printf "%-6d %-10s %4d %8.2f\n", id, name, qty, qty * price
    }
    printf "%-22s %8.2f\n", "GRAND TOTAL", total
}
