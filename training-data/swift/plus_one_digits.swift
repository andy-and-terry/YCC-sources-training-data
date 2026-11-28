func plusOne(_ digits: [Int]) -> [Int] {
    var d = digits
    for i in stride(from: d.count - 1, through: 0, by: -1) {
        if d[i] < 9 { d[i] += 1; return d }
        d[i] = 0
    }
    return [1] + d
}

print(plusOne([1, 2, 9])) // [1, 3, 0]
print(plusOne([9, 9]))    // [1, 0, 0]
