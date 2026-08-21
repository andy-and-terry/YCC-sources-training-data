func quicksort(_ items: [Int]) -> [Int] {
    if items.count <= 1 { return items }
    let pivot = items[items.count / 2]
    let left = items.filter { $0 < pivot }
    let mid = items.filter { $0 == pivot }
    let right = items.filter { $0 > pivot }
    return quicksort(left) + mid + quicksort(right)
}

print(quicksort([5, 3, 8, 1, 9, 2]))
