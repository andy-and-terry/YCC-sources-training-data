func reverse(_ a: inout [Int], _ lo: Int, _ hi: Int) {
    var i = lo, j = hi
    while i < j {
        a.swapAt(i, j)
        i += 1
        j -= 1
    }
}

// Rotate right by k using three reversals: O(n) time, O(1) space.
func rotateRight(_ a: inout [Int], by k: Int) {
    guard !a.isEmpty else { return }
    let k = ((k % a.count) + a.count) % a.count
    reverse(&a, 0, a.count - 1)
    reverse(&a, 0, k - 1)
    reverse(&a, k, a.count - 1)
}

var nums = [1, 2, 3, 4, 5, 6, 7]
rotateRight(&nums, by: 3)
print(nums)
rotateRight(&nums, by: -3)
print(nums)
