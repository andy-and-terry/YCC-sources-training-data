func mergeSort(_ items: [Int]) -> [Int] {
    guard items.count > 1 else { return items }
    let mid = items.count / 2
    let left = mergeSort(Array(items[..<mid]))
    let right = mergeSort(Array(items[mid...]))
    return merge(left, right)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var result: [Int] = []
    var i = 0, j = 0
    while i < left.count && j < right.count {
        if left[i] <= right[j] {
            result.append(left[i]); i += 1
        } else {
            result.append(right[j]); j += 1
        }
    }
    result.append(contentsOf: left[i...])
    result.append(contentsOf: right[j...])
    return result
}

print(mergeSort([5, 3, 8, 1, 9, 2]))
