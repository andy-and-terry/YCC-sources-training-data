#!/usr/bin/awk -f
# Demonstrates NR (total records seen so far) vs FNR (records seen in the
# current file), and FILENAME, when processing several files in one run.
FNR == 1 {
    print "--- starting file:", FILENAME, "---"
}
{
    print "NR=" NR, "FNR=" FNR, "FILENAME=" FILENAME, "line=" $0
}
END {
    print "total lines across all files:", NR
}
