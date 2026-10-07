#!/usr/bin/awk -f
# Extracts the first number embedded in each line using match() and substr().
{
    if (match($0, /[0-9]+/)) {
        print substr($0, RSTART, RLENGTH)
    } else {
        print "no number found"
    }
}
