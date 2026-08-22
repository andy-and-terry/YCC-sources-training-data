#!/usr/bin/awk -f
# Counts lines matching a pattern.
/error/ { count++ }
END {
    print "matches:", count + 0
}
