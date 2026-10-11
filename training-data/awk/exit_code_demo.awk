#!/usr/bin/awk -f
# exit inside main rule still runs END; exit code is kept
/STOP/ { found = 1; exit 3 }
END {
    if (found) print "stopped early at line", NR
    else print "no STOP marker"
}
