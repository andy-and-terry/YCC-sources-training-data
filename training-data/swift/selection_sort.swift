func selectionSort(_ array: [Int]) -> [Int] {
    var arr = array
    for i in 0..<arr.count {
        var minIndex = i
        for j in (i + 1)..<arr.count {
            if arr[j] < arr[minIndex] {
                minIndex = j
            }
        }
        arr.swapAt(i, minIndex)
    }
    return arr
}

print(selectionSort([64, 25, 12, 22, 11]))
