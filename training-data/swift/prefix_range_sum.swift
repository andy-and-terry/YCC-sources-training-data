struct RangeSum {
    private var prefix = [0]

    init(_ values: [Int]) {
        for v in values { prefix.append(prefix[prefix.count - 1] + v) }
    }

    func query(_ lo: Int, _ hi: Int) -> Int { prefix[hi] - prefix[lo] }
}

print(RangeSum([3, 1, 4, 1, 5, 9, 2, 6]).query(2, 5))
