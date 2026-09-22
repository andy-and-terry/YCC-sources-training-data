#!/usr/bin/awk -f
# Prints the 3 most frequent words across all input lines.
{
    for (i = 1; i <= NF; i++) counts[$i]++
}
END {
    n = 0
    for (word in counts) {
        n++
        words[n] = word
    }
    for (i = 1; i < n; i++) {
        for (j = 1; j <= n - i; j++) {
            if (counts[words[j]] < counts[words[j + 1]]) {
                temp = words[j]
                words[j] = words[j + 1]
                words[j + 1] = temp
            }
        }
    }
    top = (n < 3) ? n : 3
    for (i = 1; i <= top; i++) {
        print words[i], counts[words[i]]
    }
}
