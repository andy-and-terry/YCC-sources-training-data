func maxProduct(_ nums: [Int]) -> Int {
    var best = nums[0], hi = nums[0], lo = nums[0]
    for x in nums.dropFirst() {
        if x < 0 { swap(&hi, &lo) }
        hi = max(x, hi * x)
        lo = min(x, lo * x)
        best = max(best, hi)
    }
    return best
}

print(maxProduct([2, 3, -2, 4]), maxProduct([-2, 0, -1]), maxProduct([-2, 3, -4]))
