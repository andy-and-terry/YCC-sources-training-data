func cocktailSort(_ array: [Int]) -> [Int] {
    var arr = array
    var swapped = true
    var start = 0
    var end = arr.count - 1

    while swapped {
        swapped = false
        for i in start..<end where arr[i] > arr[i + 1] {
            arr.swapAt(i, i + 1)
            swapped = true
        }
        if !swapped { break }
        swapped = false
        end -= 1

        for i in stride(from: end - 1, through: start, by: -1) where arr[i] > arr[i + 1] {
            arr.swapAt(i, i + 1)
            swapped = true
        }
        start += 1
    }
    return arr
}

print(cocktailSort([5, 1, 4, 2, 8, 0, 2]))
