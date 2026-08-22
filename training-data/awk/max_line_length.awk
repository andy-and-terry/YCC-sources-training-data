#!/usr/bin/awk -f
# Prints the length and content of the longest line in the input.
{
    if (length($0) > maxlen) {
        maxlen = length($0)
        maxline = $0
    }
}
END {
    print maxlen, maxline
}
