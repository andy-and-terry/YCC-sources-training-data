#!/usr/bin/awk -f
# Formats the integer in the first field with comma thousands separators.
{
    n = $1
    sign = ""
    if (n < 0) {
        sign = "-"
        n = -n
    }
    n = sprintf("%d", n)
    out = ""
    len = length(n)
    for (i = 1; i <= len; i++) {
        out = out substr(n, i, 1)
        remaining = len - i
        if (remaining > 0 && remaining % 3 == 0) out = out ","
    }
    print sign out
}
