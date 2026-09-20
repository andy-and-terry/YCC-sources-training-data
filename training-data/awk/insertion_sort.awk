#!/usr/bin/awk -f
# Insertion-sorts a fixed list of numbers ascending.
BEGIN {
    split("12 11 13 5 6", nums, " ")
    n = 5
    for (i = 2; i <= n; i++) {
        key = nums[i]
        j = i - 1
        while (j >= 1 && nums[j] > key) {
            nums[j + 1] = nums[j]
            j--
        }
        nums[j + 1] = key
    }
    for (i = 1; i <= n; i++) {
        printf "%d ", nums[i]
    }
    print ""
}
