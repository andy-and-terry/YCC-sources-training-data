#!/usr/bin/awk -f
# Finds the first pair of numbers in the input whose sum equals a target value.
BEGIN {
    target = 10
}
{
    complement = target - $1
    if (complement in seen) {
        print seen[complement], $1
        found = 1
        exit
    }
    seen[$1] = $1
}
END {
    if (!found) print "no pair found"
}
