#!/usr/bin/awk -f
# Converts each input number to its binary string representation.
{
    n = $1
    if (n == 0) {
        print "0"
        next
    }
    binary = ""
    while (n > 0) {
        binary = (n % 2) binary
        n = int(n / 2)
    }
    print binary
}
