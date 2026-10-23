#!/usr/bin/awk -f
function polygonal(s, n) {
    return int(((s - 2) * n * n - (s - 4) * n) / 2)
}
BEGIN {
    split("Triangular Pentagonal Hexagonal", names, " ")
    split("3 5 6", sides, " ")
    for (i = 1; i <= 3; i++) {
        line = names[i] ":"
        for (n = 1; n <= 10; n++)
            line = line " " polygonal(sides[i], n)
        print line
    }
}
