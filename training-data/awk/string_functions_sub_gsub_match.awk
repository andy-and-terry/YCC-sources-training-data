#!/usr/bin/awk -f
BEGIN {
    s = "Hello, World"
    print length(s), toupper(s), tolower(s), substr(s, 8), substr(s, 1, 5), index(s, "World")
    t = s; n = gsub(/o/, "0", t); print t, n
    u = s; sub(/World/, "AWK", u); print u
    v = "a1b22c333"; gsub(/[0-9]+/, "<&>", v); print v
    w = "john smith"; sub(/(.*) (.*)/, "\\2, \\1", w); print w
    if (match("tel 555-1234", /[0-9]+-[0-9]+/)) print RSTART, RLENGTH, substr("tel 555-1234", RSTART, RLENGTH)
    print sprintf("%05.1f|%-6s|%3d|%x|%c", 3.14159, "ab", 7, 255, 65)
    print "x" > "/dev/stderr"
    str = "  trim me  "; gsub(/^ +| +$/, "", str); print "[" str "]"
    print length("héllo"), (("abc" ~ /^a.c$/) ? "match" : "no")
    csv = "a,b,,d"; nf = split(csv, parts, ","); print nf, "[" parts[3] "]"
}
