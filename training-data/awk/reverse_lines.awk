#!/usr/bin/awk -f
# Prints input lines in reverse order (like tac).
{
    lines[NR] = $0
}
END {
    for (i = NR; i >= 1; i--) {
        print lines[i]
    }
}
