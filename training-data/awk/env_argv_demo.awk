#!/usr/bin/awk -f
# Demonstrates reading environment variables and command-line arguments.
BEGIN {
    if ("USER" in ENVIRON) {
        print "USER=" ENVIRON["USER"]
    } else {
        print "USER is not set"
    }
    print "ARGC=" ARGC
    for (i = 0; i < ARGC; i++) {
        print "ARGV[" i "]=" ARGV[i]
    }
}
