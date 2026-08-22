import Foundation

func bubbleSort(_ array: [Int]) -> [Int] {
    var arr = array
    let n = arr.count
    for i in 0..<n {
        for j in 0..<(n - i - 1) {
            if arr[j] > arr[j + 1] {
                arr.swapAt(j, j + 1)
            }
        }
    }
    return arr
}

let data = [5, 2, 9, 1, 5, 6]
print(bubbleSort(data))
