#!/usr/bin/awk -f
# Usage: awk -f gsub_ampersand_demo.awk file
# Wrap every number in brackets using & (the matched text) and count replacements.
{
    n = gsub(/[0-9]+/, "[&]")
    total += n
    print
}
END {
    print "replacements:", total + 0
}
