// Find a pair in a sorted array that sums to target.
func pairWithSum(_ sorted: [Int], target: Int) -> (Int, Int)? {
    var left = 0
    var right = sorted.count - 1
    while left < right {
        let sum = sorted[left] + sorted[right]
        if sum == target {
            return (sorted[left], sorted[right])
        } else if sum < target {
            left += 1
        } else {
            right -= 1
        }
    }
    return nil
}

let data = [1, 3, 4, 6, 8, 11]
print(pairWithSum(data, target: 10) as Any)
print(pairWithSum(data, target: 100) as Any)
