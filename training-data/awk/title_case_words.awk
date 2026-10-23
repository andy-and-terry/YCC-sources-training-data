#!/usr/bin/awk -f
# Capitalize the first letter of every word, lowercase the rest
{
    out = ""
    for (i = 1; i <= NF; i++) {
        w = tolower($i)
        w = toupper(substr(w, 1, 1)) substr(w, 2)
        out = out (i > 1 ? " " : "") w
    }
    print out
}
