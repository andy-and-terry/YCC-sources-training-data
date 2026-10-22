func polygonal(_ sides: Int, _ n: Int) -> Int {
    ((sides - 2) * n * n - (sides - 4) * n) / 2
}

let shapes = [("Triangular", 3), ("Pentagonal", 5), ("Hexagonal", 6)]
for (name, sides) in shapes {
    let nums = (1...10).map { String(polygonal(sides, $0)) }
    print("\(name): \(nums.joined(separator: " "))")
}
