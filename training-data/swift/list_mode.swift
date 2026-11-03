func modes(_ items: [Int]) -> [Int] {
    let counts = items.reduce(into: [Int: Int]()) { $0[$1, default: 0] += 1 }
    let top = counts.values.max() ?? 0
    return counts.filter { $0.value == top }.keys.sorted()
}

print(modes([1, 2, 2, 3, 3, 4]))
