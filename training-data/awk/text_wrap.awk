#!/usr/bin/awk -f
# Wraps each input line to a fixed width, breaking on word boundaries.
BEGIN {
    width = 20
}
{
    line = ""
    for (i = 1; i <= NF; i++) {
        candidate = (line == "") ? $i : line " " $i
        if (length(candidate) > width) {
            print line
            line = $i
        } else {
            line = candidate
        }
    }
    if (line != "") print line
}
