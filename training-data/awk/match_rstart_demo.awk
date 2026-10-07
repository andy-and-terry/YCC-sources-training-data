#!/usr/bin/awk -f
# Extract the first quoted string from each line using match(), RSTART and RLENGTH.
{
    if (match($0, /"[^"]*"/)) {
        quoted = substr($0, RSTART + 1, RLENGTH - 2)
        printf "line %d: found \"%s\" at column %d (length %d)\n", NR, quoted, RSTART, RLENGTH
    } else {
        printf "line %d: no quoted string\n", NR
    }
}
