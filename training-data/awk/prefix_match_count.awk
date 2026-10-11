#!/usr/bin/awk -f
# Count lines starting with each of several prefixes
BEGIN { np = split("GET POST PUT DELETE", p, " ") }
{
    for (i = 1; i <= np; i++)
        if (index($0, p[i]) == 1) c[p[i]]++
}
END { for (i = 1; i <= np; i++) printf "%-7s %d\n", p[i], c[p[i]] + 0 }
