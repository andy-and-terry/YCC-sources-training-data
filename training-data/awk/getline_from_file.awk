#!/usr/bin/awk -f
# Read a second file line by line inside BEGIN using getline < file.
BEGIN {
    file = "/tmp/_awk_getline_demo.txt"
    print "alpha\nbeta\ngamma" > file
    close(file)
    while ((getline line < file) > 0) {
        n++
        print n ": " line
    }
    close(file)
    system("rm -f " file)
}
