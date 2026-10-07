#!/usr/bin/awk -f
# In the replacement text, & stands for the matched text.
BEGIN {
    s = "cat bat rat"
    n = gsub(/[a-z]at/, "<&>", s)
    print s, "(" n " replacements)"

    t = "price: 5 and 10"
    gsub(/[0-9]+/, "$&.00", t)
    print t

    u = "a.b.c"
    gsub(/\./, "\\&", u)   # literal ampersand
    print u
}
