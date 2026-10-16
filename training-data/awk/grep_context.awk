#!/usr/bin/awk -f
# Print each match with one line of context before and after
{ line[NR] = $0 }
/ERROR/ { hit[NR] = 1 }
END {
    for (i = 1; i <= NR; i++)
        if (hit[i]) {
            if (i > 1) print "  " line[i-1]
            print "> " line[i]
            if (i < NR) print "  " line[i+1]
            print "--"
        }
}
