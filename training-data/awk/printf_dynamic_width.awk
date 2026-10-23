#!/usr/bin/awk -f
# Right-align names using a width computed from the data
{
    names[NR] = $1
    if (length($1) > w) w = length($1)
}
END {
    for (i = 1; i <= NR; i++)
        printf "|%*s|%-*s|\n", w, names[i], w, names[i]
}
