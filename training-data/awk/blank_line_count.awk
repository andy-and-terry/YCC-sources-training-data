#!/usr/bin/awk -f
# Counts the number of blank lines in the input.
/^$/ { count++ }
END {
    print "blank lines:", count + 0
}
