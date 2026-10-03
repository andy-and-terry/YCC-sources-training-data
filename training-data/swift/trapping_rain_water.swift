func trap(_ height: [Int]) -> Int {
    guard !height.isEmpty else { return 0 }
    var left = 0
    var right = height.count - 1
    var leftMax = 0
    var rightMax = 0
    var water = 0

    while left < right {
        if height[left] < height[right] {
            leftMax = max(leftMax, height[left])
            water += leftMax - height[left]
            left += 1
        } else {
            rightMax = max(rightMax, height[right])
            water += rightMax - height[right]
            right -= 1
        }
    }
    return water
}

print(trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))
