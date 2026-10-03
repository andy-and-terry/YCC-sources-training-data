func rob(_ nums: [Int]) -> Int {
    var prevNo = 0
    var prevYes = 0
    for num in nums {
        let newYes = prevNo + num
        let newNo = max(prevNo, prevYes)
        prevYes = newYes
        prevNo = newNo
    }
    return max(prevYes, prevNo)
}

print(rob([2, 7, 9, 3, 1]))
print(rob([1, 2, 3, 1]))
