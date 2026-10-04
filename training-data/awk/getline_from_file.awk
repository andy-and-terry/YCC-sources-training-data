#!/usr/bin/awk -f
# Reads a file line by line with getline in BEGIN; creates a temp file for demo.
BEGIN {
    file = "/tmp/awk_getline_demo.txt"
    print "alpha\nbeta\ngamma" > file
    close(file)
    while ((getline line < file) > 0) {
        n++
        printf "%d: %s\n", n, line
    }
    close(file)
    system("rm -f " file)
}
