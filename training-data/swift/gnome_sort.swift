func gnomeSort(_ array: [Int]) -> [Int] {
    var arr = array
    var i = 0
    while i < arr.count {
        if i == 0 || arr[i - 1] <= arr[i] {
            i += 1
        } else {
            arr.swapAt(i, i - 1)
            i -= 1
        }
    }
    return arr
}

print(gnomeSort([5, 3, 8, 1, 9, 2]))
