#!/usr/bin/awk -f
# Count words and emit the report through an external sort pipe (descending by count).
# Usage: awk -f sort_pipe_output.awk file
{
    for (i = 1; i <= NF; i++) {
        w = tolower($i)
        gsub(/[^a-z]/, "", w)
        if (w != "") count[w]++
    }
}
END {
    cmd = "sort -k2,2nr -k1,1"
    for (w in count) {
        print w, count[w] | cmd
    }
    close(cmd)          # flush the sorted output before printing the footer
    print "-- done --"
}
