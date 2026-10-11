#!/usr/bin/awk -f
# Turn "a.b.c=1" style keys into a tree listing with indentation
BEGIN { FS = "=" }
{
    n = split($1, parts, ".")
    for (i = 1; i < n; i++) {
        path = (i == 1) ? parts[1] : path "." parts[i]
        if (!(path in shown)) { shown[path] = 1; printf "%*s%s:\n", (i-1)*2, "", parts[i] }
    }
    printf "%*s%s = %s\n", (n-1)*2, "", parts[n], $2
}
