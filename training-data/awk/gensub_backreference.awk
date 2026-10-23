#!/usr/bin/gawk -f
# gawk gensub: regex replacement with \\1 backreferences and a target count
BEGIN {
    s = "2024-03-15"
    # reorder date parts using capture groups
    print gensub(/([0-9]+)-([0-9]+)-([0-9]+)/, "\\3/\\2/\\1", "g", s)

    # replace only the 2nd occurrence
    t = "a-b-c-d"
    print gensub(/-/, "+", 2, t)

    # wrap each word in brackets; & is the whole match
    u = "red green blue"
    print gensub(/[a-z]+/, "[&]", "g", u)

    # original string is untouched, unlike sub/gsub
    print t
}
