#!/usr/bin/awk -f
# Sorts a fixed list of numbers ascending using recursive merge sort.
function merge_sort(arr, lo, hi,    mid) {
    if (lo >= hi) return
    mid = int((lo + hi) / 2)
    merge_sort(arr, lo, mid)
    merge_sort(arr, mid + 1, hi)
    merge(arr, lo, mid, hi)
}
function merge(arr, lo, mid, hi,    i, j, k, left, right, n1, n2) {
    n1 = mid - lo + 1
    n2 = hi - mid
    for (i = 1; i <= n1; i++) left[i] = arr[lo + i - 1]
    for (j = 1; j <= n2; j++) right[j] = arr[mid + j]
    i = 1; j = 1; k = lo
    while (i <= n1 && j <= n2) {
        if (left[i] <= right[j]) {
            arr[k] = left[i]; i++
        } else {
            arr[k] = right[j]; j++
        }
        k++
    }
    while (i <= n1) { arr[k] = left[i]; i++; k++ }
    while (j <= n2) { arr[k] = right[j]; j++; k++ }
}
BEGIN {
    n = split("5 2 9 1 5 6 3", nums, " ")
    merge_sort(nums, 1, n)
    for (i = 1; i <= n; i++) printf "%s ", nums[i]
    print ""
}
