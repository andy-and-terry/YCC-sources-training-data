func heapify(_ arr: inout [Int], _ n: Int, _ i: Int) {
    var largest = i
    let left = 2 * i + 1
    let right = 2 * i + 2
    if left < n && arr[left] > arr[largest] { largest = left }
    if right < n && arr[right] > arr[largest] { largest = right }
    if largest != i {
        arr.swapAt(i, largest)
        heapify(&arr, n, largest)
    }
}

func heapSort(_ arr: [Int]) -> [Int] {
    var a = arr
    let n = a.count
    for i in stride(from: n / 2 - 1, through: 0, by: -1) {
        heapify(&a, n, i)
    }
    for i in stride(from: n - 1, to: 0, by: -1) {
        a.swapAt(0, i)
        heapify(&a, i, 0)
    }
    return a
}

print(heapSort([5, 3, 8, 1, 9, 2]))
