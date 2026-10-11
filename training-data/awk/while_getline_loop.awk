#!/usr/bin/awk -f
# Read the rest of the input manually with getline in a BEGIN block
BEGIN {
    while ((getline line < ARGV[1]) > 0) {
        n++
        if (line ~ /^[0-9]+$/) sum += line
    }
    close(ARGV[1])
    print n, "lines; numeric sum", sum
    ARGV[1] = ""
}
