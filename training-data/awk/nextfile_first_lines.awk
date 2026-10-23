#!/usr/bin/gawk -f
# Print only the first N lines of each input file using nextfile
BEGIN { N = 2 }

FNR == 1 { printf "== %s ==\n", FILENAME }

FNR <= N { print FNR ": " $0 }

FNR == N { nextfile }   # skip the rest of this file, move on to the next

END { print "done" }
# run: gawk -f nextfile_first_lines.awk file1.txt file2.txt
