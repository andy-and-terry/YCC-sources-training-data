#!/usr/bin/awk -f
BEGIN {
    s = "the quick brown fox"
    print index(s, "quick")
    print substr(s, 5, 5)
    if (match(s, /b[a-z]+/))
        print RSTART, RLENGTH, substr(s, RSTART, RLENGTH)
}
