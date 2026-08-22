func binarySearch(_ array: [Int], target: Int) -> Int {
    var low = 0
    var high = array.count - 1
    while low <= high {
        let mid = (low + high) / 2
        if array[mid] == target {
            return mid
        } else if array[mid] < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return -1
}

let sorted = [1, 3, 5, 7, 9, 11, 13]
print(binarySearch(sorted, target: 7))
print(binarySearch(sorted, target: 4))
