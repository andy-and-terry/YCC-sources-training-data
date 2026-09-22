#!/usr/bin/awk -f
# Sorts a fixed list of numbers ascending using insertion sort.
function insertion_sort(arr, n,    i, j, key) {
    for (i = 2; i <= n; i++) {
        key = arr[i]
        j = i - 1
        while (j >= 1 && arr[j] > key) {
            arr[j + 1] = arr[j]
            j--
        }
        arr[j + 1] = key
    }
}
BEGIN {
    n = split("5 2 9 1 5 6 3", nums, " ")
    insertion_sort(nums, n)
    for (i = 1; i <= n; i++) {
        printf "%s ", nums[i]
    }
    print ""
}
