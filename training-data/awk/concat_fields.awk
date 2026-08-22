#!/usr/bin/awk -f
{
    result = ""
    for (i = 1; i <= NF; i++) result = result $i
    print result
}
