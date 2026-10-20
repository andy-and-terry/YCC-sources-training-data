#!/usr/bin/awk -f
BEGIN {
    "echo hello from shell" | getline line
    print line
    close("echo hello from shell")
    cmd = "printf '3\\n1\\n2\\n'"
    while ((cmd | getline v) > 0) vals[++n] = v
    close(cmd)
    print n, vals[1] + vals[2] + vals[3]
    rc = system("exit 3")
    print "rc", rc
    print "sorted:" | "sort"
    print "b" | "sort"; print "a" | "sort"
    close("sort")
    "date +%Y" | getline year; close("date +%Y")
    print (year >= 2024) ? "year ok" : "year weird"
    printf "%s\n", ENVIRON["HOME"] != "" ? "has HOME" : "no HOME"
}
