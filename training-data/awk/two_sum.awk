#!/usr/bin/awk -f
# Finds a pair of indices (1-based) whose values sum to the target.
function two_sum(target,    i, complement, seen) {
    for (i = 1; i <= 5; i++) {
        complement = target - nums[i]
        if (complement in seen) {
            printf "%d %d\n", seen[complement], i
            return
        }
        seen[nums[i]] = i
    }
    print "no pair found"
}
BEGIN {
    split("2 7 11 15 3", nums, " ")
    two_sum(9)
    two_sum(26)
    two_sum(100)
}
