func quickselect(_ array: [Int], _ k: Int) -> Int {
    var arr = array

    func partition(_ low: Int, _ high: Int) -> Int {
        let pivot = arr[high]
        var i = low
        for j in low..<high {
            if arr[j] < pivot {
                arr.swapAt(i, j)
                i += 1
            }
        }
        arr.swapAt(i, high)
        return i
    }

    func select(_ low: Int, _ high: Int) -> Int {
        if low == high { return arr[low] }
        let pivotIndex = partition(low, high)
        if k == pivotIndex {
            return arr[k]
        } else if k < pivotIndex {
            return select(low, pivotIndex - 1)
        } else {
            return select(pivotIndex + 1, high)
        }
    }

    return select(0, arr.count - 1)
}

let numbers = [7, 10, 4, 3, 20, 15]
print(quickselect(numbers, 2))
print(quickselect(numbers, 0))
