final class SegmentTree {
    private var tree: [Int]
    private let n: Int

    init(_ data: [Int]) {
        n = data.count
        tree = [Int](repeating: 0, count: 2 * n)
        for i in 0..<n {
            tree[n + i] = data[i]
        }
        for i in stride(from: n - 1, through: 1, by: -1) {
            tree[i] = tree[2 * i] + tree[2 * i + 1]
        }
    }

    func update(_ index: Int, _ value: Int) {
        var i = index + n
        tree[i] = value
        while i > 1 {
            i /= 2
            tree[i] = tree[2 * i] + tree[2 * i + 1]
        }
    }

    func query(_ left: Int, _ right: Int) -> Int {
        var l = left + n
        var r = right + n + 1
        var sum = 0
        while l < r {
            if l % 2 == 1 {
                sum += tree[l]
                l += 1
            }
            if r % 2 == 1 {
                r -= 1
                sum += tree[r]
            }
            l /= 2
            r /= 2
        }
        return sum
    }
}

let tree = SegmentTree([1, 3, 5, 7, 9, 11])
print(tree.query(1, 3))
tree.update(1, 10)
print(tree.query(1, 3))
