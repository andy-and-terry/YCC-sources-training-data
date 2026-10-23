#!/usr/bin/gawk -f
# gawk PROCINFO["sorted_in"] controls for-in traversal order
BEGIN {
    score["alice"] = 82
    score["bob"] = 95
    score["carol"] = 78
    score["dave"] = 95

    PROCINFO["sorted_in"] = "@ind_str_asc"
    print "by name:"
    for (n in score) printf "  %-6s %d\n", n, score[n]

    PROCINFO["sorted_in"] = "@val_num_desc"
    print "by score (high first):"
    for (n in score) printf "  %-6s %d\n", n, score[n]

    PROCINFO["sorted_in"] = ""      # back to default order
}
