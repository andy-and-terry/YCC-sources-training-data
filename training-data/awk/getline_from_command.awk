#!/usr/bin/awk -f
BEGIN {
    cmd = "echo one two three"
    while ((cmd | getline line) > 0)
        print "got:", line
    close(cmd)
}
