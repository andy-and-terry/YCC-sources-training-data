#!/usr/bin/awk -f
BEGIN {
    limit = 50
    for (i = 2; i <= limit; i++) composite[i] = 0
    for (i = 2; i * i <= limit; i++)
        if (!composite[i])
            for (j = i * i; j <= limit; j += i) composite[j] = 1
    for (i = 2; i <= limit; i++) if (!composite[i]) out = out (out == "" ? "" : " ") i
    print out
}
