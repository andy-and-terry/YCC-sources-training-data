#!/usr/bin/awk -f
BEGIN {
    rows = 6
    for (i = 0; i < rows; i++) {
        line = ""
        for (j = 0; j <= i; j++) {
            if (j == 0 || j == i) t[i, j] = 1
            else t[i, j] = t[i - 1, j - 1] + t[i - 1, j]
            line = line (j ? " " : "") t[i, j]
        }
        print line
    }
}
