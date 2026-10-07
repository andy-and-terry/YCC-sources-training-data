#!/usr/bin/awk -f
# Counts vowels (case-insensitive) in each line of input.
{
    line = tolower($0)
    count = 0
    for (i = 1; i <= length(line); i++) {
        c = substr(line, i, 1)
        if (c == "a" || c == "e" || c == "i" || c == "o" || c == "u") {
            count++
        }
    }
    printf "%s: %d\n", $0, count
}
