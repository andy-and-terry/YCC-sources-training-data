func allEqual<T: Equatable>(_ xs: [T]) -> Bool {
    guard let f = xs.first else { return true }
    return xs.allSatisfy { $0 == f }
}

extension Array where Element: Numeric {
    func total() -> Element { reduce(0, +) }
}

print(allEqual([1, 1, 1]), allEqual(["a", "b"]))
print([1, 2, 3].total(), [1.5, 2.5].total())
