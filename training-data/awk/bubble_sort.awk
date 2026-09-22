#!/usr/bin/awk -f
# Bubble-sorts a fixed list of numbers ascending.
BEGIN {
    split("5 3 8 1 9 2", nums, " ")
    n = 6
    for (i = 1; i < n; i++) {
        for (j = 1; j <= n - i; j++) {
            if (nums[j] > nums[j + 1]) {
                tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
            }
        }
    }
    for (i = 1; i <= n; i++) {
        printf "%d ", nums[i]
    }
    print ""
}
