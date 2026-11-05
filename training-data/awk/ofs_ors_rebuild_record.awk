#!/usr/bin/awk -f
BEGIN { FS = ":"; OFS = "," }
{
    $1 = $1
    print
}
