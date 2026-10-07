#!/usr/bin/awk -f
# Demonstrates reading the output of an external command with `cmd | getline`.
BEGIN {
    cmd = "echo hello-from-subprocess"
    if ((cmd | getline line) > 0) {
        print "got: " line
    }
    close(cmd)
}
