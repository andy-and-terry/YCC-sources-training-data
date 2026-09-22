final class FenwickTree {
    private var tree: [Int]
    private let n: Int

    init(_ size: Int) {
        n = size
        tree = [Int](repeating: 0, count: size + 1)
    }

    func add(_ index: Int, _ delta: Int) {
        var i = index + 1
        while i <= n {
            tree[i] += delta
            i += i & (-i)
        }
    }

    func prefixSum(_ index: Int) -> Int {
        var i = index + 1
        var total = 0
        while i > 0 {
            total += tree[i]
            i -= i & (-i)
        }
        return total
    }

    func rangeSum(_ left: Int, _ right: Int) -> Int {
        prefixSum(right) - (left > 0 ? prefixSum(left - 1) : 0)
    }
}

let ft = FenwickTree(6)
for (i, v) in [1, 3, 5, 7, 9, 11].enumerated() {
    ft.add(i, v)
}
print(ft.rangeSum(1, 3)) // 15
ft.add(1, 10)
print(ft.rangeSum(1, 3)) // 25
