#!/usr/bin/awk -f
# Sorts a fixed list of numbers ascending using selection sort.
function selection_sort(arr, n,    i, j, min_idx, temp) {
    for (i = 1; i <= n - 1; i++) {
        min_idx = i
        for (j = i + 1; j <= n; j++) {
            if (arr[j] < arr[min_idx]) {
                min_idx = j
            }
        }
        if (min_idx != i) {
            temp = arr[i]
            arr[i] = arr[min_idx]
            arr[min_idx] = temp
        }
    }
}
BEGIN {
    n = split("5 2 9 1 5 6 3", nums, " ")
    selection_sort(nums, n)
    for (i = 1; i <= n; i++) {
        printf "%s ", nums[i]
    }
    print ""
}
