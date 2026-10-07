#!/usr/bin/awk -f
# Demonstrates redirecting print/printf output to files and to a pipe,
# and the importance of close() before re-reading a redirected target.
{
    if ($2 + 0 >= 60) {
        print $0 > "/tmp/awk_redirect_pass.txt"
    } else {
        print $0 > "/tmp/awk_redirect_fail.txt"
    }
    print $1, $2 | "sort -k2,2n > /tmp/awk_redirect_sorted.txt"
}
END {
    close("/tmp/awk_redirect_pass.txt")
    close("/tmp/awk_redirect_fail.txt")
    close("sort -k2,2n > /tmp/awk_redirect_sorted.txt")

    print "--- pass ---"
    while ((getline line < "/tmp/awk_redirect_pass.txt") > 0) print line
    close("/tmp/awk_redirect_pass.txt")

    print "--- fail ---"
    while ((getline line < "/tmp/awk_redirect_fail.txt") > 0) print line
    close("/tmp/awk_redirect_fail.txt")

    print "--- sorted by score ---"
    while ((getline line < "/tmp/awk_redirect_sorted.txt") > 0) print line
    close("/tmp/awk_redirect_sorted.txt")
}
