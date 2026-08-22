#!/usr/bin/awk -f
{
    for (i = 1; i <= NF; i++) {
        word = tolower($i)
        counts[word]++
    }
}
END {
    for (word in counts) {
        print counts[word], word
    }
}
