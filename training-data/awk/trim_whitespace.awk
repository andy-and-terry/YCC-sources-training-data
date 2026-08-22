#!/usr/bin/awk -f
function trim(s) {
    gsub(/^[ \t]+|[ \t]+$/, "", s)
    return s
}
{
    print "[" trim($0) "]"
}
