#!/usr/bin/awk -f
# Reverses the characters within each line (not the line order).
{
    reversed = ""
    for (i = length($0); i >= 1; i--) {
        reversed = reversed substr($0, i, 1)
    }
    print reversed
}
