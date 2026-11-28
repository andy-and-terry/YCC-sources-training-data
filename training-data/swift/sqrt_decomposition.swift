struct SqrtSum {
    let a: [Int]
    let bs: Int
    let blk: [Int]

    init(_ a: [Int], blockSize: Int) {
        self.a = a
        bs = blockSize
        blk = stride(from: 0, to: a.count, by: blockSize).map { a[$0..<min($0 + blockSize, a.count)].reduce(0, +) }
    }

    func query(_ l: Int, _ r: Int) -> Int {
        var s = 0, i = l
        while i <= r {
            if i % bs == 0 && i + bs - 1 <= r { s += blk[i / bs]; i += bs }
            else { s += a[i]; i += 1 }
        }
        return s
    }
}
print(SqrtSum([5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5], blockSize: 4).query(2, 9))
