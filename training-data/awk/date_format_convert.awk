#!/usr/bin/awk -f
# Converts MM/DD/YYYY dates from stdin to YYYY-MM-DD.
{
    split($0, parts, "/")
    if (length(parts) == 3) {
        printf "%s-%02d-%02d\n", parts[3], parts[1], parts[2]
    } else {
        print "invalid: " $0
    }
}
