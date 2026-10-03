#!/usr/bin/awk -f
# Parses a URL query string ("a=1&b=2&c=3") into key/value pairs.
BEGIN {
    query = "name=alice&age=30&city=nyc"
    n = split(query, pairs, "&")
    for (i = 1; i <= n; i++) {
        split(pairs[i], kv, "=")
        printf "%s -> %s\n", kv[1], kv[2]
    }
}
