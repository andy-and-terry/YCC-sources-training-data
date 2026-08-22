#!/usr/bin/awk -f
# Converts comma-separated input into tab-separated output.
BEGIN {
    FS = ","
    OFS = "\t"
}
{
    $1 = $1
    print
}
