#!/usr/bin/awk -f
# gsub with & (matched text) and sub/gsub return counts.
BEGIN {
    s = "the cat sat on the mat"
    n = gsub(/[a-z]at/, "<&>", s)
    print s, "(" n " replacements)"
    t = "2024-05-17"
    sub(/-/, "/", t)
    print t
    u = "a.b.c"
    gsub(/\./, "\\&", u)
    print u
}
