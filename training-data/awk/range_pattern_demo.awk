#!/usr/bin/awk -f
# Range patterns: print lines between START and END markers (inclusive).
# Usage: printf 'a\nSTART\nb\nc\nEND\nd\n' | awk -f range_pattern_demo.awk
/START/,/END/ {
    if ($0 !~ /START|END/) print "inside:", $0
}
