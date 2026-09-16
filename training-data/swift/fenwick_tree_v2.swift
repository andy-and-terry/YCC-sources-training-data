final class FenwickTree {
    private var tree: [Int]
    private let size: Int

    init(size: Int) {
        self.size = size
        self.tree = Array(repeating: 0, count: size + 1)
    }

    func update(_ index: Int, _ delta: Int) {
        var i = index + 1
        while i <= size {
            tree[i] += delta
            i += i & (-i)
        }
    }

    func prefixSum(_ index: Int) -> Int {
        var i = index + 1
        var sum = 0
        while i > 0 {
            sum += tree[i]
            i -= i & (-i)
        }
        return sum
    }

    func rangeSum(_ left: Int, _ right: Int) -> Int {
        if left == 0 { return prefixSum(right) }
        return prefixSum(right) - prefixSum(left - 1)
    }
}

let values = [3, 2, -1, 6, 5, 4, -3, 3, 7, 2]
let fenwick = FenwickTree(size: values.count)
for (i, v) in values.enumerated() {
    fenwick.update(i, v)
}

print(fenwick.rangeSum(0, 5))
print(fenwick.rangeSum(3, 8))
fenwick.update(2, 10)
print(fenwick.rangeSum(0, 5))
