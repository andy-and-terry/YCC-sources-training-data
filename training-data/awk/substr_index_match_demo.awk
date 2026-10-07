#!/usr/bin/awk -f
BEGIN {
    s = "the quick brown fox"
    print substr(s, 5, 5)        # quick
    print substr(s, 17)          # fox
    print index(s, "brown")      # 11
    if (match(s, /[a-z]+ fox/)) {
        print RSTART, RLENGTH, substr(s, RSTART, RLENGTH)
    }
    print length(s)
    print toupper(substr(s, 1, 1)) substr(s, 2)
}
