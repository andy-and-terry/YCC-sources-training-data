#!/usr/bin/awk -f
# Splits the second field on ':' and prints the parts.
{
    n = split($2, parts, ":")
    for (i = 1; i <= n; i++) print parts[i]
}
