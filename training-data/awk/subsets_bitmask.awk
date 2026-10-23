# Enumerate all subsets of a list using a bitmask
BEGIN {
    n = split("a b c", items, " ")
    total = 2 ^ n
    for (mask = 0; mask < total; mask++) {
        out = ""
        for (i = 1; i <= n; i++)
            if (int(mask / (2 ^ (i - 1))) % 2 == 1)
                out = out (out == "" ? "" : ",") items[i]
        print "{" out "}"
    }
}
