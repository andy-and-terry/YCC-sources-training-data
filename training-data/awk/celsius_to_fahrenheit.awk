#!/usr/bin/awk -f
{
    f = $1 * 9 / 5 + 32
    printf "%s C = %.1f F\n", $1, f
}
