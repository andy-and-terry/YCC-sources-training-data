struct Ring: Collection {
    private let items: [Int]
    private let offset: Int

    init(_ items: [Int], startingAt offset: Int) {
        self.items = items
        self.offset = items.isEmpty ? 0 : offset % items.count
    }

    var startIndex: Int { 0 }
    var endIndex: Int { items.count }

    func index(after i: Int) -> Int { i + 1 }

    subscript(position: Int) -> Int {
        items[(position + offset) % items.count]
    }
}

let ring = Ring([1, 2, 3, 4, 5], startingAt: 2)
print(Array(ring))
print(ring.count)
print(ring.first ?? -1)
print(ring.map { $0 * 10 })
print(ring.filter { $0.isMultiple(of: 2) })
print(ring.reversed())
