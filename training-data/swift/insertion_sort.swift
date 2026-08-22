func insertionSort(_ array: [Int]) -> [Int] {
    var arr = array
    for i in 1..<arr.count {
        let key = arr[i]
        var j = i - 1
        while j >= 0 && arr[j] > key {
            arr[j + 1] = arr[j]
            j -= 1
        }
        arr[j + 1] = key
    }
    return arr
}

print(insertionSort([12, 11, 13, 5, 6]))
