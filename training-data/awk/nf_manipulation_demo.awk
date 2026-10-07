#!/usr/bin/awk -f
# Demonstrates truncating and padding fields by reassigning NF.
{
    print "original (" NF " fields): " $0
    NF = 2
    print "truncated: " $0
    NF = 5
    print "padded: " $0
}
