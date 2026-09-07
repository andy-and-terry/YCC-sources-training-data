#!/usr/bin/awk -f
# Run-length encodes each input line, e.g. aaabbc -> a3b2c1
{
    line = $0
    out = ""
    n = length(line)
    i = 1
    while (i <= n) {
        c = substr(line, i, 1)
        run = 1
        while (i + run <= n && substr(line, i + run, 1) == c) run++
        out = out c run
        i += run
    }
    print out
}
