func fourSumCount(_ a: [Int], _ b: [Int], _ c: [Int], _ d: [Int]) -> Int {
    var sums: [Int: Int] = [:]
    for x in a { for y in b { sums[x + y, default: 0] += 1 } }
    var count = 0
    for x in c { for y in d { count += sums[-(x + y)] ?? 0 } }
    return count
}

print(fourSumCount([1, 2], [-2, -1], [-1, 2], [0, 2])) // 2
