#!/usr/bin/awk -f
# Sorts a fixed list of numbers ascending using recursive quicksort.
function quicksort(arr, lo, hi,    pivot, i, j, temp) {
    if (lo >= hi) return
    pivot = arr[int((lo + hi) / 2)]
    i = lo
    j = hi
    while (i <= j) {
        while (arr[i] < pivot) i++
        while (arr[j] > pivot) j--
        if (i <= j) {
            temp = arr[i]; arr[i] = arr[j]; arr[j] = temp
            i++; j--
        }
    }
    quicksort(arr, lo, j)
    quicksort(arr, i, hi)
}
BEGIN {
    n = split("5 2 9 1 5 6 3", nums, " ")
    quicksort(nums, 1, n)
    for (i = 1; i <= n; i++) {
        printf "%s ", nums[i]
    }
    print ""
}
