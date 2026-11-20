// Bead (gravity) sort.
func beadSort(_ nums: [Int]) -> [Int] {
    var cols = [Int](repeating: 0, count: nums.max() ?? 0)
    for n in nums { for i in 0..<n { cols[i] += 1 } }
    return nums.indices.map { r in cols.filter { $0 > r }.count }.reversed()
}
print(beadSort([5, 3, 1, 4, 2]))
