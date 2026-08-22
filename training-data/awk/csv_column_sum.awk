#!/usr/bin/awk -f
BEGIN { FS = "," }
{
    total += $2
}
END {
    print "total:", total + 0
}
