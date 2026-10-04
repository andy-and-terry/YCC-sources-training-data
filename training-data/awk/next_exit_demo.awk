#!/usr/bin/awk -f
# Skip comment lines with next, stop at an END marker with exit and set the exit status.
/^#/ { next }
/^END$/ { exit 3 }
NF == 0 { blank++; next }
{
    lines++
    print NR ": " $0
}
END {
    printf "lines=%d blank=%d\n", lines, blank
}
