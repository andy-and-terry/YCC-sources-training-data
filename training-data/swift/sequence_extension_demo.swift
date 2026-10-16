extension Sequence {
    func count(where predicate: (Element) -> Bool) -> Int {
        var n = 0
        for e in self where predicate(e) { n += 1 }
        return n
    }
}

extension Sequence where Element: Numeric {
    func sum() -> Element {
        reduce(0, +)
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

let values = [3, 8, 1, 9, 4]
print(values.count(where: { $0 > 3 }))
print(values.sum())
print([1.5, 2.5].sum())
print(values[safe: 10] as Any)
print(values[safe: 1] as Any)
