#!/usr/bin/awk -f
# Sorts a fixed list of numbers ascending using insertion sort.
BEGIN {
    split("5 3 8 1 9 2", nums, " ")
    n = 6
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
