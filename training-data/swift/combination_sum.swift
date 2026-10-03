func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result: [[Int]] = []
    var current: [Int] = []
    let sorted = candidates.sorted()

    func backtrack(_ start: Int, _ remaining: Int) {
        if remaining == 0 {
            result.append(current)
            return
        }
        for i in start..<sorted.count {
            if sorted[i] > remaining { break }
            current.append(sorted[i])
            backtrack(i, remaining - sorted[i])
            current.removeLast()
        }
    }

    backtrack(0, target)
    return result
}

print(combinationSum([2, 3, 6, 7], 7))
