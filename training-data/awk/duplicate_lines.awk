#!/usr/bin/awk -f
# Prints only lines that appear more than once in the input.
{
    count[$0]++
    if (count[$0] == 1) {
        order[++n] = $0
    }
}
END {
    for (i = 1; i <= n; i++) {
        if (count[order[i]] > 1) {
            print order[i]
        }
    }
}
