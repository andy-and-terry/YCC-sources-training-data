#!/usr/bin/awk -f
# Count each character in the input (split with empty separator).
{
    n = split($0, chars, "")
    for (i = 1; i <= n; i++)
        if (chars[i] != " ") freq[chars[i]]++
}
END {
    for (c in freq) printf "%s %d\n", c, freq[c] | "sort"
}
