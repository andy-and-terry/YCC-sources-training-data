#!/usr/bin/awk -f
BEGIN {
    FS = "\t"
    OFS = ","
}
{
    $1 = $1
    print
}
