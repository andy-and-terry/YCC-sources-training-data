#!/usr/bin/awk -f
# Prints every email-looking token found in the input.
{
    line = $0
    while (match(line, /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+/)) {
        print substr(line, RSTART, RLENGTH)
        line = substr(line, RSTART + RLENGTH)
    }
}
