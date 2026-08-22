#!/usr/bin/awk -f
BEGIN { FS = "," }
NR == 1 {
    split($0, headers, ",")
    next
}
{
    printf "{"
    for (i = 1; i <= NF; i++) {
        printf "\"%s\": \"%s\"", headers[i], $i
        if (i < NF) printf ", "
    }
    print "}"
}
