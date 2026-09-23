#!/usr/bin/awk -f
# Capitalizes the first letter of each word in a line, lowercasing the rest.
{
    out = ""
    for (i = 1; i <= NF; i++) {
        word = tolower($i)
        first = toupper(substr(word, 1, 1))
        rest = substr(word, 2)
        out = out (i > 1 ? " " : "") first rest
    }
    print out
}
