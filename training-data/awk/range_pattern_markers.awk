#!/usr/bin/awk -f
# Print lines between BEGIN_BLOCK and END_BLOCK markers (inclusive)
/BEGIN_BLOCK/,/END_BLOCK/ {
    n++
    print n ": " $0
}
END {
    print "lines in range:", n + 0
}
