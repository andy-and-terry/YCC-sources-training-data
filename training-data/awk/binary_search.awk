#!/usr/bin/awk -f
function binary_search(target,    lo, hi, mid) {
    lo = 1
    hi = 7
    while (lo <= hi) {
        mid = int((lo + hi) / 2)
        if (arr[mid] == target) return mid
        else if (arr[mid] < target) lo = mid + 1
        else hi = mid - 1
    }
    return -1
}
BEGIN {
    split("2 4 7 10 15 19 23", arr, " ")
    print binary_search(15)
    print binary_search(6)
}
